""" Workflows Page Locators

    [TODO] ADD DESC
"""

# Programs Page Locators
lbl_programs_title = '//h4[@class="page-title"][contains(text(),"Programs List")]'
btn_add_programs = '//button[@data-target="#addProgramModal"]'
tbl_programs = '//table[@id="level1Table"]'

# Projects Page Locators
lbl_projects_title = '//h4[@class="page-title"][contains(text(),"Projects List")]'
btn_projects_status_filter = '//button[contains(text(),"Projects Status")]'
btn_add_projects = '//button[@data-target="#addProjectModal"]'
# [TODO]: This ID should changes to "projectsTable"
tbl_projects = '//table[@id="programsTable"]'
