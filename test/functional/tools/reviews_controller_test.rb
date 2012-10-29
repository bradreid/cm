require_relative '../../test_helper'

class Tools::ReviewsControllerTest < ActionController::TestCase


  context '#captcha_verified?' do
    should 'be TRUE when the session variable captcha_verified is true' do
      @request.session[:captcha_verified] = true
      assert @controller.send :captcha_verified?
    end

    should 'be FALSE when the session variable captcha_verified is false' do
      @request.session[:captcha_verified] = false
      assert !@controller.send(:captcha_verified?)
    end
  end

  context '#new' do
    setup do
      @admin_user_to_email = create :admin_user
      @tool = create :tool
    end

    context 'captcha' do
      should 'render the new form with a captcha when the user is not logged in and has not previously verified a captcha' do
        get :new, tool_id: @tool.to_param
        assert_template 'new'
        assert_select "textarea[name='recaptcha_challenge_field']", 1
      end

      should 'NOT render the captcha when the user is logged in' do
        sign_in @admin_user_to_email
        get :new, tool_id: @tool.to_param
        assert_template 'new'
        assert_select "textarea[name='recaptcha_challenge_field']", 0
      end

      should 'NOT render the captcha when the user is not logged in but previously verified a captcha' do
        @request.session[:captcha_verified] = true
        get :new, tool_id: @tool.to_param
        assert_template 'new'
        assert_select "textarea[name='recaptcha_challenge_field']", 0
      end
    end
  end

  context '#create' do
    setup do
      @admin_user_to_email = create :admin_user
      @tool = create :tool
    end

    context 'successful review creation' do
      should 'create the review when the user is logged in' do
        sign_in @admin_user_to_email
        assert_difference 'Review.count' do
          post :create, tool_id: @tool.to_param, review: attributes_for(:review)
        end
        assert_response :redirect
        assert_redirected_to tool_path(@tool)
      end

      should 'create the review when the user is not logged but is currently verifying the captcha' do
        @controller.stubs(:verify_recaptcha).returns(true)
        assert_difference 'Review.count' do
          post :create, tool_id: @tool.to_param, review: attributes_for(:review)
        end
        assert_response :redirect
        assert_redirected_to tool_path(@tool)
      end

      should 'create the review when the user is not logged and previously verified the captcha' do
        @request.session[:captcha_verified] = true
        @controller.stubs(:verify_recaptcha).returns(false)
        assert_difference 'Review.count' do
          post :create, tool_id: @tool.to_param, review: attributes_for(:review)
        end
        assert_response :redirect
        assert_redirected_to tool_path(@tool)
      end
    end

    context 'captcha' do
      should 'render the new form with a captcha when the user is not logged in and has not previously verified a captcha' do
        @controller.expects(:verify_recaptcha).returns(false)
        post :create, tool_id: @tool.to_param, review: {}
        assert_template 'new'
        assert_select "textarea[name='recaptcha_challenge_field']", 1
        assert_match(/Please correct the following:/, flash[:error_tic])
      end

      should 'NOT render the captcha when the user verified the captcha and the review could not be saved due to validation errors' do
        @controller.expects(:verify_recaptcha).returns(true)
        post :create, tool_id: @tool.to_param, review: {}
        assert_template 'new'
        assert_select "textarea[name='recaptcha_challenge_field']", 0
      end

      should 'NOT render the captcha when the user is logged in' do
        sign_in @admin_user_to_email
        post :create, tool_id: @tool.to_param, review: {}
        assert_template 'new'
        assert_select "textarea[name='recaptcha_challenge_field']", 0
      end

      should 'NOT render the captcha when the user is not logged in but previously verified a captcha' do
        @controller.stubs(:verify_recaptcha).returns(false)
        @request.session[:captcha_verified] = true
        post :create, tool_id: @tool.to_param, review: {}
        assert_template 'new'
        assert_select "textarea[name='recaptcha_challenge_field']", 0
      end
    end
  end
end
