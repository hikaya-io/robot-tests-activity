""" Dashboard Page Locators

    [TODO] ADD DESC
"""

lbl_dashboard_title = '//h4[@class="page-title"][contains(text(),"My Dashboard")]'
btn_program_list = '//button[contains(text(), "Program")]'
btn_add_program = '//button[@data-target="#addProgramModal"]'

lbl_workflow_panel_title = '//h4[contains(text(),"Workflows")]'
lb_program_info = '//a[@href="/workflow/level1"]'
lbl_program_num = lb_program_info + '/p[@class="box-info-number"]'
lb_project_info = '//a[@href="href="/workflow/level2/list/0/none""]'
lbl_project_num = lb_project_info + '/p[@class="box-info-number"]'

lbl_indicator_panel_title = '//h4[contains(text(),"Indicator")]'
lb_indicator_info = '//a[@href="/indicators/home/0/0/0/"]'
lbl_indicator_num = lb_indicator_info + '/p[@class="box-info-number"]'

lbl_components_panel_title = '//h4[contains(text(),"Components")]'
