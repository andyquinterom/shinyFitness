function(input, output, session) {

  user <- reactiveValues(
    auth = FALSE,
    excers = list(
      bench = list(
        name = "Bench press",
        notes = "Bench press",
        image_url = "https://upload.wikimedia.org/wikipedia/commons/a/a8/Bench-press-1.png"
      ),
      squat = list(
        name = "Squat",
        notes = "Normal squat",
        image_url = "https://upload.wikimedia.org/wikipedia/commons/8/82/Squats.svg"
      )
    )
  )

  observe({
    user$auth <- TRUE
    user$uid <- 1
  }) %>%
    bindEvent(input$auth)

  observe({
    if (user$auth) {
      uid <- user$uid
      user$info_table <- tbl(conn, "users") %>%
        filter(uid == uid) %>%
        collect()
      if (nrow(user$info_table) == 0) {
        user$info_table <- data.frame(
          uid = uid,
          username = "default",
          age = 19,
          weight = 81,
          unit = "kg"
        )
        dbWriteTable(
          conn = conn,
          name = "users",
          user$info_table,
          append = TRUE
        )
      }
    }
  }) %>%
    bindEvent(user$auth)


  output$list_excer <- renderUI({
    if (user$auth) {
      purrr::map(
        .x = user$excers,
        .f = function(excer) {
          tags$div(
            style = "
              background-color: white;
              padding: 5px 5px 5px 5px;
              margin: 10px 10px 10px 10px;
              max-width: 70%;
              color: black;
            ",
            tags$img(
              style = "width: 100%",
              src = excer$image_url
            ),
            tags$h2(excer$name),
            tags$p(excer$notes)
          )
        }
      )
    }
  }) %>%
    bindEvent(user$excers, user$auth)

  observe({
    if (user$auth) {
      new_excer <- list(
        name = list(
          name = input$new_excer_name,
          notes = input$new_excer_notes,
          image_url = input$new_excer_url
        )
      )
      names(new_excer) <- input$new_excer_name
      user$excers <- user$excers %>%
        append(new_excer)
    }
  }) %>%
    bindEvent(input$new_excer_save)

}
