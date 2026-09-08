#set page(
  paper: "us-letter",
  margin: (top: 2.5in),
  header: [
    #grid(
      columns: (1fr, 1fr),
      image("ecelogo.png", height: 0.8in),
      align(right)[
        Dillon Gutowski \
        9/7/2026 \
        #strong(text(fill: rgb("1F497D"))[EEL3701C - Fall 2026])
      ]
    )
  ],
  numbering: (current, total) => [Page #current],
  number-align: right
)

#set text(
  font: "Helvetica",
  size: 12pt,
)

#show heading: set text(fill:rgb("1F497D"))

#show heading.where(level: 1): it => [
  #align(center)[
    #strong(it.body)
  ]
  #v(0.5em)
]

#show heading.where(level: 2): it => [
  #strong(it.body)
  #v(-0.75em)
  #line(length: 100%, stroke: rgb("1F497D"))
]

= Lab 1: Basic Logic Design
== Requirements Not Met

[Insert any requirements you were unable to meet, for whatever reason. If none, write N/A.]

== Problems Encountered

[Summarize all issues you had while working on this lab.]

== Applications

[Briefly describe potential applications of the content you learned in this lab.]


#pagebreak()

#let nt(con) = $overline(#con) #h(0.1em)$

== Pre-Lab Questions

=== Part 1: Boolean algebra simplification
+ $F = A * B + A * nt(B) + nt(A) * B$
  - Order of operations: $F = (A * B) + (A * nt(B)) + (nt(A) * B$)
  - Inverse distribution: $F = A*(nt(B) + B) + (nt(A) * B)$
  - Inverse: $F = A*1 + (nt(A) * B)$
  - Identity: $F = A + (nt(A) * B)$
  - Distribution: $F = (A + nt(A))*(A + B)$
  - Inverse: $F = 1 * (A+B)$
  - Identity: $F = A+B$
+ $Z = nt(V) W + X + nt(Y)(X + nt(V) W)$
  - Commutation: $Z = X + nt(V)W + (X + nt(V)W)nt(Y)$
  - Association: $Z = (X + nt(V)W) + (X + nt(V)W)nt(Y)$
  - Absorption: $Z = X + nt(V)W$

=== Part 2: Implementation
[TODO]

=== Part 3: Security system design
#let truth_table(columns, ..cells) = {
  let table_cells = columns + cells.pos().map(val => {
    if val == 0 {
      table.cell(fill: black, align(center)[#text(fill:white)[0]])
    } else if val == 1 {
      table.cell(fill: white, align(center)[1])
    } else {
      val
    }
  })
  text(font: "JetBrainsMono NF", table(columns: columns.len(), ..table_cells))
  }
+ Truth table:
  #truth_table(
    ("D", "W", "M", "A", "S"),
    0, 0, 0, table.vline(stroke: 3pt + gray), 0, 1,
    0, 0, 1, 1, 1,
    0, 1, 0, 0, 1,
    0, 1, 1, 1, 1,
    1, 0, 0, 0, 1,
    1, 0, 1, 1, 1,
    1, 1, 0, 0, 0,
    1, 1, 1, 0, 1
  )
+ $A(D, W, M) = Sigma_(m)(1, 3, 5) = nt(D)nt(W)M + nt(D)W M + D nt(W)M$\
  Simplify:
  - Inverse distribution: $nt(D)(nt(W)M + W M) + D nt(W)M$
  - Commutation: $nt(D)(M nt(W) + M W) + D nt(W)M$
  - Inverse distribution: $nt(D)(M (nt(W) + W)) + D nt(W)M$
  - Inverse: $nt(D)(M dot 1) + D nt(W)M$
  - Identity: $nt(D)M + D nt(W)M$
  - Inverse distribution: $M(nt(D) + D nt(W))$
  - Distribution: $M((nt(D) + D)(nt(D)+nt(W)))$
  - Inverse: $M(1 dot (nt(D)+nt(W))$
  - Identity: $M(nt(D)+nt(W))$
  - De Morgan's: $M nt(D W)$
  *So, $A = M nt(D dot W)$*
+ $S(D, W, M) = Pi_(s)(6) = nt(D) + nt(W) + M$\
  Simplify:
  - De Morgan's: $nt(D W) + M$
  *So, $S = nt(D W) + M$*

