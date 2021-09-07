shinyUI(
  f7Page(
    f7TabLayout(
      f7Tabs(
        f7Tab(
          tabName = "main",
          active = TRUE
        ),
        f7Tab(
          tabName = "workouts",
          active = TRUE
        ),
        f7Tab(
          tabName = "excer",
          active = TRUE,
          tags$div(
            id = "list_excer"
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
