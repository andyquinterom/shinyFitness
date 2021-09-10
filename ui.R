shinyUI(
  f7Page(
    f7TabLayout(
      f7Tabs(
        f7Tab(
          tabName = "main",
          active = TRUE,
          f7Button(
            inputId = "auth",
            label = "LogIn"
          )
        ),
        f7Tab(
          tabName = "workouts",
          active = TRUE,
          f7Select(
            inputId = "wo_day_select",
            label = "Day",
            choices = 1:3
          ),
          uiOutput(outputId = "wo_day_summary")
        ),
        f7Tab(
          tabName = "excer",
          active = TRUE,
          uiOutput(
            outputId = "list_excer"
          )
        ),
        f7Tab(
          tabName = "new_excer",
          active = TRUE,
          f7Text(
            inputId = "new_excer_name",
            label = "Name of excercise"
          ),
          f7TextArea(
            inputId = "new_excer_notes",
            label = "Notes"
          ),
          f7Text(
            inputId = "new_excer_url",
            label = "URL of Image"
          ),
          f7Button(
            inputId = "new_excer_save",
            label = "Save"
          )
        ),
        .items = NULL,
        id = NULL,
        swipeable = FALSE,
        animated = TRUE,
        style = c("toolbar", "segmented", "strong")
      ),
      navbar = f7Navbar(
        title = "ShinyFitness"
      ),
      panels = NULL,
      appbar = NULL
    )
  )
)
