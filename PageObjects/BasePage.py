""" Base Page Locators

    This script declares all the locators commont to the various 
    pages on the Activty Application.

    Locators for Pages that are frequently used, like the Login
    Page, are also declared.
"""

# Common UI Locators
# menu items
hl_workflows = '//a[contains(text(),"Workflows")]'
hl_wf_programs = 'link:Programs'
hl_wf_projects = 'link:Projects'
hl_indicators = '//a[contains(text(),"Indicators")][@role="button"]'
hl_ind_indicators = '//a[./text()="Indicators"]'
hl_ind_objectives = 'link:Objectives'
hl_form_library = '//a[contains(text(),"Form Library")]'
hl_fl_beneficiaries = 'link:Beneficiaries'
hl_fl_ditributions = 'link:Distributions'
hl_fl_trainings = 'link:Trainings'
hl_components = '//a[contains(text(),"Components")]'
hl_comp_contacts = 'link:Contacts'
hl_comp_documents = 'link:Documents'
hl_comp_locations = 'link:Locations'
hl_comp_stakeholders = 'link:Stakeholders'
hl_reports = '//a[contains(text(),"Reports")]'
hl_rpt_dashboards = 'link:Dashboards'
# buttons
btn_close = '//button[@class="btn btn-md btn-close"]'
btn_programs_filter = '//button[contains(text(),"Programs")]'
btn_projects_filter = '//button[contains(text(),"Projects")]'
btn_list_view = '//a[contains(.,"List")]'
# search textbox
tb_search_data_table = '//div[@class="dataTables_filter"]/label/input'

# User Settings Popup
hl_user_popup = 'css:ul.navbar-right > li > a'
lbl_signed_in_user = '//li[contains(text(),"signed in as")]/strong'
hl_user_profile = '//a[contains(text(),"Profile")]'
hl_user_org_settings = '//a[contains(text(),"Organization Settings")]'
hl_add_new_org = '//a[@href="/accounts/register/organization"]'
hl_sign_out = '//a[contains(text(),"Sign out")]'

# Login Page Locators
lbl_login_title = '//h1[contains(text(),"Login")]'
hl_login_tab = '//a[@href="/accounts/login/"]'
txt_login_desc = 'Fill in your login details to start your session'
tb_login_username = 'login_username'
tb_login_password = 'login_password'
btn_login_submit = 'login_submit_btn'
hl_forgot_password = '//a[@href="/accounts/user/password_reset/"]'
pnl_alerts_container = 'alerts'

# Register Page Locators
lbl_reg_title = '//h1[contains(text(),"Create an account")]'
hl_reg_tab = '//a[@href="/accounts/register/user/none/"]'
txt_reg_des = 'Fill in your details (mandatory fields are marked with *)'
tb_reg_first_name = 'register_first_name'
tb_reg_last_name = 'register_last_name'
tb_reg_username = 'register_username'
tb_reg_email_address = 'register_email_address'
tb_reg_password = 'register_password'
tb_reg_confirm_password = 'register_confirm_password'
btn_reg_submit = 'register_submit_btn'
lbl_reg_confirm_email_title = '//h1[contains(text(),"Confirm Your Email Address")]'
btn_login = '//a[@href="/accounts/login/"]'

# Collapsible Login Panel
hl_login_dropdown = '//div[@id="activity-navbar-collapse"]//a'
pnl_login = 'login-dropdown'
tb_pnl_login_username = pnl_login + '//input[@placeholder="Username"]'
tb_pnl_login_password = pnl_login + '//input[@placeholder="Password"]'
btn_pnl_login_username = pnl_login + '//button[@class="btn btn-success"]'

# Footer Locators
hl_footer_hikaya = '//b[contains(text(),"Hikaya")]'
hl_footer_doc = '//b[contains(text(),"Documentation")]'
hl_footer_lic = '//b[contains(text(),"License")]'

# Floating Chat
icon_chat = '//div[@class="chat-content"]'

# Toast Pop Up
pnl_toast = 'toast-container'
lbl_toast_title = 'css:.toast-title'
lbl_toast_message = 'css:.toast-message'
