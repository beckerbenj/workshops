
library(eatATA)

# Itempool
str(items_mini)

# haeufig genutzte Konstanten
nForms <- 1

# Objective Function
Btime <- minObjective(nForms, itemValues = items_mini$time, itemIDs = items_mini$item)

# Constraints
Blength <- itemsPerFormConstraint(nForms, nItems = nrow(items_mini), targetValue = 10,
                                  operator = "=", itemIDs = items_mini$item)
Bdiff <- itemValuesRangeConstraint(nForms, itemValues = items_mini$difficulty,
                                   range = c(-0.1, 0.1), itemIDs = items_mini$item)

# Use Solver
solver_out <- useSolver(list(Btime, Blength, Bdiff))

# Loesung inspizieren
inspectSolution(solver_out, items = items_mini, idCol = "item")

appendSolution(solver_out,
  items = items_mini, idCol = "item")



## Uebungsaufgabe
# ----------------------------------------------------------------------------------------
# Erstellt 2 Bloecke mit folgenden Testspezifikationen:
# -> beide Blocke Testzeit so nah wie moeglich an 450 Sekunden (via minimaxObjective() Funktion)
# -> durschnittliche Schwierigkeit pro Block von ca. 0.3
# -> ein Item darf nur in einem Block vorkommen (via itemUsageConstraint() Funktion)
# Setzt dabei dem Solver ein Zeitlimit von 10 Sekunden!

# optional: jedes Itemformat sollte exakt 3 Mal pro Block vorkommen

