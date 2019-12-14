""" Organization Settings Page Locators

    [TODO] ADD DESC
"""

hl_bc_org_settings = '//ul[@class="breadcrumb"]/li/a[./text()="Organization Settings"]'
lbl_bc_profile = '//ul[@class="breadcrumb"]/li[./text()="Profile"]'
lbl_bc_configurations = '//ul[@class="breadcrumb"]/li[./text()="Configurations"]'
lbl_bc_people = '//ul[@class="breadcrumb"]/li[./text()="People"]'
hl_bc_people = '//ul[@class="breadcrumb"]/li/a[./text()="People"]'
lbl_bc_pending_invite = '//ul[@class="breadcrumb"]/li[./text()="Pending Invitations"]'
lbl_org_settings_title = '//h4[@class="page-title"][contains(text(),"Organization Settings")]'
hl_tab_profile = '//a[@aria-controls="profile"]'
hl_tab_configurations = '//a[@aria-controls="configurations"]'
hl_tab_people = '//a[@aria-controls="people"]'
hl_tab_usage = '//a[@aria-controls="usage"]'

# Profile Tab
pnl_org_logo = 'div[@for="organizationLogo"]'
tb_org_logo = 'organizationLogo'
tb_org_name = 'name'
tb_org_desc = 'id:description'
btn_org_save = 'updateOrganization'

# Configurations Tab
# Workflow Level Labels
tb_workflowlevel1 = 'workflowlevel1'
# lbl_workflowlevel1 = '//label[@for="workflowlevel1"]'
txt_workflowlevel1 = 'Workflow Level 1:'
tb_workflowlevel2 = 'workflowlevel2'
# lbl_workflowlevel2 = '//label[@for="workflowlevel2"]'
txt_workflowlevel2 = 'Workflow Level 2:'
tb_workflowlevel3 = 'workflowlevel3'
# lbl_workflowlevel3 = '//label[@for="workflowlevel3"]'
txt_workflowlevel3 = 'Workflow Level 3:'
tb_workflowlevel4 = 'workflowlevel4'
# lbl_workflowlevel4 = '//label[@for="workflowlevel4"]'
txt_workflowlevel4 = 'Workflow Level 4:'
# Other Labels
tb_indicator = 'indicator'
tb_site = 'site'
tb_stakeholder = 'stakeholder'
tb_form = 'form'
# Default Settings
tb_default_currency = 'name:"default_currency"'
tb_date_format = 'name:"date_format"'
tb_default_language = 'name:"default_language"'
tb_theme_color = 'name:"theme_color"'

# People Tab
btn_roles = '//button[contains(text(),"Role(s)")]'
hl_role_all = btn_roles + '/..//a[./text()="--All--"]'
hl_role_editor = '//a[./text()="Editor"]'
hl_role_owner = '//a[./text()="Owner"]'
hl_role_viewer = '//a[./text()="Viewer"]'
btn_status = '//button[contains(text(),"Status")]'
hl_status_all = btn_status + '/..//a[./text()="--All--"]'
hl_status_active = '//a[./text()="Active"]'
hl_status_inactive = '//a[./text()="inctive"]'
btn_invite_users = '//div[@class="sub-nav-item"][4]//button'
hl_invite_users = '//a[contains(text(),"Invite Users")]'
hl_pending_invite = '//a[contains(text(),"Pending Invitations")]'
tbl_users = 'userTable'
# Invite People Modal
mdl_invite_user = 'inviteUserModal'
lbl_invite_people_title = 'inviteUserLabel'
txt_invite_people_title = 'Invite people'
icon_close = '//button[@data-dismiss="modal"][@type="button"]'
tb_email_address = 'css:.select2-search__field'
lbi_email_choice = '//li[@class="select2-selection__choice"]'
icon_remove_choice = '/span[@class="select2-selection__choice__remove"]'
dd_invite_org = '//span[@aria-labelledby="select2-id_organization-container"]'
lbl_org_fbh = '//li[contains(text(),"For Better Humans")]'  # User Create Data
btn_close = '//button[@data-dismiss="modal"][@type="reset"]'
btn_invite = 'inviteUser'
# Pending Invitations Page
lbl_pending_invite_title = '//h4[@class="page-title"][contains(text(),"Pending Invitations")]'
btn_organizations = '//button[contains(text(),"Organizations")]'
hl_org_all = btn_organizations + '/..//a[./text()="--All--"]'
hl_org_fbh = '//a[contains(text(),"For Better Humans")]'

# Toast Messages
txt_toast_invite_title = 'Invitation Successful'
# [TODO: Undo typo once fixed]
txt_toast_invite_pmsg = 'You have successfuly invited '
