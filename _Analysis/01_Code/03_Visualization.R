scatter1 <- hchart(data, "scatter", hcaes(x = productivity,
                                          y = performance,
                                          group = mechanism))

scatter2 <- hchart(data, "scatter", hcaes(x = productivity,
                                          y = perfDiff,
                                          group = mechanism))

regression <- plot_ly(data = data[data$mechanism == "performanceBased", ],
                      x    = ~productivity,
                      y    = ~perfDiff,
                      type = "scatter",
                      mode = "markers") %>% 
        add_trace(x    = ~productivity,
                  y    = fitted(fit1),
                  mode = "lines")