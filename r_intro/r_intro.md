Introduction to R
================

# Introduction

Welcome to Introduction to R\! This workshop introduces you R by working
through common tasks in data science: importing, manipulating, and
exporting data.

R is a statistical and programming computer language widely used for a
variety of applications.

Before proceeding with these training materials, please ensure you have
access to [Open OnDemand](https://ood.acer.uic.edu) or have locally
installed both R and RStudio as described
[here](http://www.fredhutch.io/software/#r-and-rstudio).

This training adapted from the [Fred Hutch Intro to
R](https://github.com/fredhutchio/r_intro) and the [Data Carpentry Intro
to R](https://datacarpentry.org/R-ecology-lesson/), Copyright (c) Data
Carpentry.

## Learning Objectives

By the end of this session, you should be able to:

  - work within the RStudio interface to run and save R code in a
    project
  - understand basic R syntax to use functions and assign objects
  - create and manipulate vectors and understand how R deals with
    missing data
  - import spreadsheet-style data into R as a data frame
  - extract portions of data from a data frame
  - install and load packages
  - transform and summarize data using dplyr
  - export spreadsheet-style data

## A brief orientation to RStudio

[R](https://cran.r-project.org) is a statistical programming language,
while [RStudio](https://rstudio.com) is an integrated development
environment (IDE) that allows you to code in R more easily. RStudio
possesses many features that you may find useful in your work. We’ll
highlight a few of the most common and useful parts for our introductory
course.

The first time you open RStudio, you’ll see three panels, or windows.

1.  The panel on the left is the console, where you can run R code. The
    text printed in this panel is basic information about R and the
    version you’re running. You can test how the console can be used to
    run code by entering `3 + 4` and then pressing enter. This instructs
    your computer to read, interpret, and execute the command, then
    print the result (`7`) to the Console, and show a right facing arrow
    (`>`), indicating it is ready to accept additional code.
2.  The panel on the top right is the environment. It’s empty right now,
    but we’ll learn more about this later in this lesson.
3.  The panel on the lower right shows the files present in your working
    directory. Currently, that’s probably your `Home` directory, which
    includes folders like `Documents` and `Downloads`.

You may notice that some of the panels possess additional tabs. We’ll
explore some of these features in this class, but for more information:

`Help -> Cheetsheets -> RStudio IDE cheat sheet`

This PDF includes an overview of each of the things you see in RStudio,
as well as explanations of how you can use them. It may be intimidating
right now, but will come in handy as you gain experience with R.

One of the ways that RStudio makes working in R easier is by allowing
you to create R projects. You can think of a project as a discrete unit
of work, such as a chapter of a thesis/dissertation, analysis for a
manuscript, or a monthly report. We recommend organizing your code,
data, and other associated files as projects, which allows you to keep
all parts of an analysis together for easier access.

We’ll be creating a project to use for the duration of this course.
Create a new project in RStudio:

  - `File -> New Project`
  - Choose `New Directory`, then `New Project`
  - name your project `intro_r` and save it somewhere on your computer
    you’ll be able to find easily later (we recommend your Desktop or
    Documents)
  - Click `Create project`

After your RStudio screen reloads, note two things:

  - The file browser in the lower right panel will now show the contents
    of a new folder, `intro_r`, that was created as a part of your
    RStudio project.
  - The console window will show the path, or location in your computer,
    for your project directory. This is important later in class, when
    this path will be required to locate data for analysis.

Now we’re ready to create a new R script:

  - `File -> New File -> R Script`
  - Save the new file as `intro.R`. By default, RStudio will save this
    in your project directory.

This R script is a text file that we’ll use to save code we learn in
this class. We’ll refer to this window as the script or source window.
Remember to save this file periodically to retain the record of the work
you’re doing, so you can re-execute the code later if necessary.

By convention, a script should include a title at the top, so type the
following on the first line:

`# Introduction to R`

# Functions and objects

## Using functions

Now that we have a project and new script set up, we’re ready to begin
adding code. Skipping a line after the title, type the following on the
next two lines:

``` r
# basic math
4 + 5 
```

    ## [1] 9

The first of the two boxes above represents the code you execute. The
second box (prefaced with `##`) shows the output you should expect. The
`[1]` in the second box means there is one item (in this case, `9`)
present in the output.

The first line in that example is a code comment. It is not interpreted
by R, but is a human-readable explanation of the code that follows. This
is also how we included a title in our script. In R, anything to the
right of one or more `#` symbols represents a comment.

The code above is the same mathematical operation we executed earlier.
If we wanted to re-run this command, we have two options:

1.  Copy and paste the code into the Console
2.  Use the `Run` button at the top of the script window
3.  Use the keyboard shortcut: `Ctrl` + `Enter` (on Macs, `Cmd` +
    `Return`)

The third option is the most efficient, especially as your coding skills
progress. With your cursor on the line with `4 + 5`, hold down the
`Control` key and press `Enter` (or `Command` and `Return`). You’ll see
the code and answer both appear in the Console. A few things to note
about this keyboard shortcut:

  - It doesn’t matter where your cursor is on the line of code; the
    entire line will be executed with the keyboard shortcut.
  - If there isn’t code on the line where your cursor is located,
    RStudio will attempt to execute following lines.

In practice, a script should represent code you are developing in R, and
you should only save the code that you know functions. For this class,
we’ll be including notes about things we learn as comments.

> `Ctrl + Enter` is the only keyboard shortcut we emphasize in this
> course, but there are many others available. You can view them on the
> second page of the cheat sheet linked above, or by going to `Help ->
> Keyboard Shortcuts Help`.

If you were looking carefully, you may have noticed that the `+` in the
previous code example had spaces on either side, separating it from the
numbers. You may wonder whether spaces matter in how the code is
interpreted. As with many questions in coding, the easiest way to assess
whether removing the spaces matters is to simply try it:

``` r
# same code as above, without spaces
4+5
```

    ## [1] 9

Given the output, we can conclude that spaces do not matter in how the
code functions. In this case, however, spaces represent a common
convention in formatting R code, as it makes it easier for human eyes to
read. In general, you should attempt to replicate the code presented
here as closely as possible, and we’ll do our best to note when
something is required as opposed to convention.

> Code convention and style doesn’t make or break the ability of your
> code to run, but it does affect whether other people can easily
> understand your code. A brief overview of common code style is
> available [here](http://adv-r.had.co.nz/Style.html), and more
> information is available in the [tidyverse style
> guide](https://style.tidyverse.org).

Here are some other arithmetic operators in R:

``` r
# subtraction
2 - 3
```

    ## [1] -1

``` r
# multiplication
2 * 3
```

    ## [1] 6

``` r
# division
2 / 3
```

    ## [1] 0.6666667

``` r
# exponentiation
2 ^ 3
```

    ## [1] 8

So far, we’ve used R with mathematical symbols representing operations.
R possesses the ability to perform much more complex tasks using
functions, which is a pre-defined set of code that allows you to repeat
particular actions.

R includes functions for other types of math:

``` r
# using a function: rounding numbers
round(3.14)
```

    ## [1] 3

In this case, `round` is the function, and `3.14` is the number (data)
being manipulated by the function. A word followed by parentheses is a
common format for functions in R.

> Syntax refers to the rules that dictate how combinations of words and
> symbols are interpreted in a language (either programming or human).

Additional options for modifying functions are called arguments, and are
included with the data between parentheses. For the `round` function, a
common modification would be the number of decimal points output. You
can change this detail by adding a comma and then additional argument:

``` r
# using a function with more arguments
round(3.14, digits = 1)
```

    ## [1] 3.1

If you would like to learn more about how this function works, you can
go to the bottom righthand panel and click on the `Help` tab. Enter the
name of a function into the search box and hit `Enter`. Alternatively,
execute the following in your console:

`?round`

This is a shortcut for performing the same task in the panel described
above.

R help documentation tends to be formatted very consistently. At the
very top, you’ll see the name of the function. Below that, a short title
indicates the purpose of the function, along with a more verbose
“Description”. “Usage” tells you how to use the function in code, and
“Arguments” details each of the optiond in “Usage”. The rest of the
subheadings should be self-explanatory.

In the example above, there is no label associated with `3.14`. In
reality, `3.14` represents `x`, so the command can actually be written
as `round(x = 3.14, digits = 1)`. Even if not explicitly stated, the
computer assumes that `3.14` represents `x` if the number is the first
thing that appears after the opening parenthesis.

If you define both arguments explicitly, you can switch the order in
which they appear:

``` r
# can switch order of arguments
round(digits = 1, x = 3.14)
```

    ## [1] 3.1

If you remove the labels (`round(1, 3.14)`), the answer is different,
because R is assuming you mean `round(x = 1, digits = 3.14)`.

> You may notice that boxes pop up as you type. These represent
> RStudio’s attempts to guess what you’re typing and share additional
> options.

**Exercise:** what does the function `hist` do? What are its main
arguments? How did you determine this?

<details>

**<summary>Solution</summary>**

`hist` computes a histogram from data and plots it. There is a required
argument `x`, which is the data. The function has many optional
arguments, but `breaks` is an important one, which specifies how the
data will be split to produce the histogram. You can find this either by
executing `?hist` or by searching for `hist` in the Help pane.

``` r
?hist
```

</details>

## Assigning objects

So far, we’ve been performing tasks with R that require us to input the
data manually. One of the strengths of using a programming language is
the ability to assign data to objects, or variables.

> Objects in R are referred to as variables in other programming
> languages. We’ll use these terms synonymously for this course, though
> in other contexts there may be differences between them. Please see
> the [R documentation on
> objects](https://cran.r-project.org/doc/manuals/r-release/R-lang.html#Objects)
> for more information.

Like in math, a variable is a word used to represent a value (in this
case, a number):

``` r
# assigning value to an object
weight_kg <- 55
```

In the code above, `<-` is the assignment operator: it instructs R to
recognize `weight_kg` as representing the value 55. You can think of
this code as referencing “55 goes into weight\_kg.”

In RStudio, typing `Alt` + `-` (push `Alt` at the same time as the `-`
key) will write `<-` in a single keystroke on a PC, while typing
`Option` + `-` does the same on a Mac.

After executing the code above, you’ll see the object appear in the
Environment panel on the upper right hand side of the RStudio screen.
The name of the object will appear on the left, with the value assigned
to it on the right.

The name you assign to objects can be arbitrary, but we recommend using
names that are relatively short and meaningful in the context of the
values they represent. It’s useful to also know other general
limitations on object names:

  - case sensitive
  - cannot start with numbers
  - avoid other common words in R (e.g., function names, like `mean`)
  - avoid dots (underscores are a good alternative, such as the example
    above)

Extra information on object names is available in the [tidyverse style
guide](https://style.tidyverse.org/syntax.html#object-names).

Now that the object has been assigned, we can reference that object by
executing its name:

``` r
# recall object
weight_kg
```

    ## [1] 55

Thus, the value `weight_kg` represents is printed to the Console.

We can also perform operations on an object:

``` r
# multiply an object (convert kg to lb)
2.2 * weight_kg
```

    ## [1] 121

In that case, the answer is printed to the Console. You can also assign
the output to a new object:

``` r
# assign weight conversion to object
weight_lb <- 2.2 * weight_kg
```

After executing that line of code, you’ll see `weight_lb` appear in the
Environment panel, too.

Now let’s explore what happens if we assign a value to an existing
object name:

``` r
# reassign new value to an object
weight_kg <- 100
```

Note that the value assigned to `weight_kg` as it appears in the
Environment panel changes after executing the code above.

Has the value assigned to `weight_lb` also changed? You might expect
this would be the case, since this value is derived from `weight_kg`.
However, `weight_kg` remains the same as previously assigned. If you
want the value for `weight_kg` to reflect the new value for `weight_kg`,
you will need to again execute `weight_lb <- 2.2 * weight_kg`. This
should help you understand an important concept in writing code: the
order in which you execute lines of code matters\! In the context of the
material we cover in this class, we’ll continue saving code in scripts
so we have a record of both the relevant commands and the appropriate
order for execution.

> You can think of the names of objects like sticky notes. You have the
> option to place the sticky note (name) on any value you choose. You
> can pick up the sticky note and place it on another value, but you
> need to explicitly tell R when you want values assigned to certain
> objects.

At this point in the lesson, it’s common to have accidentally created an
object with a typo in the name. If this has happened to you, it’s useful
to know how to remove the object to keep your environment up to date.
Here, we’ll practice removing an object with something everyone has
available:

``` r
# remove object
remove(weight_lb) 
```

This removes the specified object from the environment, which you can
confirm by its absence in the Environment panel. You can also abbreviate
this command to `rm(weight_lb)`.

> You can clear the entire environment using the button at the top of
> the Environment panel with a picture of a broom. This may seem
> extreme, but don’t worry\! We can re-create all the work we’ve already
> done by executing each line of code again.

**Exercise:** what is the value of each item at each step?

``` r
mass <- 47.5            # mass?
width  <- 122             # width?
mass <- mass * 2.0      # mass?
width  <- width - 20        # width?
mass_index <- mass/width  # mass_index?
```

<details>

**<summary>Solution</summary>**

``` r
mass <- 47.5
mass
```

    ## [1] 47.5

``` r
width  <- 122
width
```

    ## [1] 122

``` r
mass <- mass * 2.0
mass
```

    ## [1] 95

``` r
width  <- width - 20 
width
```

    ## [1] 102

``` r
mass_index <- mass/width
mass_index
```

    ## [1] 0.9313725

</details>

## Vectors

So far, we’ve worked with objects containing a single value. For most
research purposes, however, it’s more realistic to work with a
collection of values. We can do that in R by creating a vector with
multiple values:

``` r
# assign vector
ages <- c(50, 55, 60, 65) 
# recall vector
ages
```

    ## [1] 50 55 60 65

The `c` function used above stands for “combine,” meaning all of the
values in parentheses after it are included in the object. This is
reflected in the Console, where recalling the value shows all four
values, and the Environment window, where multiple values are shown on
the right side.

We can use functions to ask basic questions about our vector, including:

``` r
# how many things are in object?
length(ages)
```

    ## [1] 4

``` r
# what type of object?
class(ages)
```

    ## [1] "numeric"

``` r
# get overview of object
str(ages)
```

    ##  num [1:4] 50 55 60 65

In the code above, we learn that there are four items (values) in our
vector, and that the vector is composed of numeric data. `str` stands
for “structure”, and shows us a general overview of the data, including
a preview of the first few values (or all the values, as is the case in
our small vector).

Even more useful is the ability to use functions to perform more complex
tasks for us, such as statistical summaries:

``` r
# performing functions with vectors
mean(ages)
```

    ## [1] 57.5

``` r
range(ages)
```

    ## [1] 50 65

Although we’ve focused on numbers as data so far, it’s also possible for
data to be words instead:

``` r
# vector of body parts
organs <- c("lung", "kidney", "heart")
```

In this case, each word is encased in quotation marks, indicating these
are character data, rather than object names.

**Exercise:** Please answer the following questions about `organs`:

  - How many values are in `organs`?
  - What type of data is `organs`?
  - get overview of `organs`

<details>

**<summary>Solution</summary>**

``` r
length(organs)
```

    ## [1] 3

``` r
class(organs)
```

    ## [1] "character"

``` r
str(organs)
```

    ##  chr [1:3] "lung" "kidney" "heart"

</details>

<p>

</p>

We’ve seen data as numbers and letters so far. In fact, R has all of the
following basic data types:

  - **character**: sometimes referred to as string data, tend to be
    surrounded by quotes
  - **numeric**: real or decimal numbers, sometimes referred to as
    “double”
  - integer: a subset of numeric in which numbers are stored as integers
  - **logical**: Boolean data (TRUE and FALSE)
  - complex: complex numbers with real and imaginary parts (e.g., 1 +
    4i)
  - raw: bytes of data (machine readable, but not human readable)

The three data types listed in **bold** above are the focus of this
class. R automatically interprets the type as you enter data. Most data
analysis activities will not require you to understand specific details
of the other data types.

**Exercise:** What happens when we try to mix multiple types of data in
a single vector?

``` r
num_char <- c(1, 2, 3, "a")
num_logical <- c(1, 2, 3, TRUE)
char_logical <- c("a", "b", "c", TRUE)
tricky <- c(1, 2, 3, "4")
```

<details>

**<summary>Solution</summary>**

Vectors can be of only one data type. R tries to convert (coerce) the
content of this vector to find a “common denominator” that doesn’t lose
any information.

``` r
num_char
```

    ## [1] "1" "2" "3" "a"

In `num_char`, the numerics are converted to characters.

``` r
num_logical
```

    ## [1] 1 2 3 1

In `num_logical`, the logical is converted to numeric (`1`).

``` r
char_logical
```

    ## [1] "a"    "b"    "c"    "TRUE"

In `char_logical`, the logical is converted to character (`"TRUE"`)

``` r
tricky
```

    ## [1] "1" "2" "3" "4"

In `tricky`, the numerics are converted to characters.

</details>

## Manipulating vectors

In the section above, we learned to create and assess vectors, and use
functions to calculate statistics across the values. We can also modify
a vector after it’s been created:

``` r
# add a value to end of vector
ages <- c(ages, 90) 
```

The example above uses the same combine (`c`) function as when we
initially created the vector. We can also use it to add values to the
beginning of the vector:

``` r
# add value at the beginning
ages <- c(30, ages)
```

If we wanted to extract, or subset, a portion of a vector:

``` r
# extracting second value
organs[2] 
```

    ## [1] "kidney"

In general, square brackets (`[ ]`) in R refer to a part of an object.
The number 2 indicates the second value in the vector.

> The index position of a value is the number associated with its
> location in a collection. In the example above, note that R indexes
> (or counts) starting with 1. This is different from many other
> programming languages, like Python, which use 0-based indexing.

In R, a minus sign (`-`) can be used to negate a value’s position, which
excludes that value from the output:

``` r
# excluding second value
organs[-2] 
```

    ## [1] "lung"  "heart"

You may be tempted to try extracting multiple values at a time by
separating the numbers with commas (e.g., `organs[2,3]`). This will
result in a rather cryptic error, which we’ll talk more about next time.
For now, remember that you can use the combine function to indicate
multiple values for subsetting:

``` r
# extracting first and third values
organs[c(1, 3)] 
```

    ## [1] "lung"  "heart"

We’ll switch back to our numerical `ages` object to explore another
common need when subsetting: extracting values based on a condition (or
criteria). For numerical data, we’re often interested in extracting data
that are in a certain range of values. It is tempting to try something
like:

``` r
ages > 60 
```

    ## [1] FALSE FALSE FALSE FALSE  TRUE  TRUE

The result, however, is less than satisfying: you receive either TRUE or
FALSE for each data point, depending on whether it meets the condition
or not.

While that information isn’t quite what we expected, we can combine it
with the subsetting syntax we learned earlier:

``` r
# extracts values which meet condition
ages[ages > 60] 
```

    ## [1] 65 90

If we read the code above from the inside out (a common strategy for R),
the code above identifies which values meet the criteria, and the square
brackets are used to extract this from the original vector.

If you want to extract items exactly equal to a specific value, you need
to use two equal signs:

``` r
# extracts values numerically equivalent values
ages[ages == 60]
```

    ## [1] 60

You can think of this as a way to differentiate mathematical equivalency
from specification of parameters for arguments (such as `digits = 1` for
`round()`, as we learned earlier). R also allows you to use \<= and \>=.

Finally, it’s common to need to combine conditions while subsetting. For
example, you may be interested in only values between 50 and 60:

``` r
# ages less than 50 OR greater than 60
ages[ages < 50 | ages > 60]
```

    ## [1] 30 65 90

In the code above, the vertical pipe `|` is interpreted to mean “or,” so
each data point can belong to either the category on the left of the
pipe, the category on the right, or both. In other words, the vertical
pipe means any single value being evaluated must meet one or both
conditions.

You can also combine conditions with `&`, but this means any single
value must meet **both** conditions:

``` r
# ages greater than 50 AND less than 60
ages[ages > 50 & ages < 60]
```

    ## [1] 55

> Be careful when thinking about human language as opposed to
> programming languges. When speaking, we is reasonable to say “extract
> all values below 50 and above 60.” While this makes sense in context,
> it is mathematically impossible for a value to be both less than 50
> AND greater than 60.

**Exercise:** Is it possible to apply more than two conditions at once?

<details>

**<summary>Solution</summary>** Yes, but you may need parentheses to
specify the grouping. For example, the following selects all ages that
are either less than 55 or between 59 and 64:

``` r
ages[ages < 55 | (ages >= 59 & ages <= 64)]
```

    ## [1] 30 50 60

</details>

<p>

</p>

**Exercise:** What does the following code return, and why?

``` r
"four" > "five"
```

<details>

**<summary>Solution</summary>**

``` r
"four" > "five"
```

    ## [1] TRUE

R interprets these as character data, and five comes before four
alphabetically, which is used to assess the logic statement.

</details>

## Missing data

Most of the data we encounter has missing data. Programming languages
interpret and handle missing data in different ways, so it’s worth
taking time to dig into how R approaches this issue.

First, we’ll create a new vector some values indicated as missing data:

``` r
# create a vector with missing data
heights <- c(2, 4, 4, NA, 6)
```

In the vector above, `NA` represents a value where data are missing. You
may notice `NA` is not encased in quotation marks. This is because R
interprets that set of characters specifically as missing data.

Next, let’s investigate how this vector responds to use in functions:

``` r
# calculate mean and max on vector with missing data
mean(heights)
```

    ## [1] NA

``` r
max(heights)
```

    ## [1] NA

The answer isn’t very satisfying; we’re told the answer is missing data
because of the presence of a single missing value in the vector. This is
a slightly frustrating default behavior for some common statistical
functions in R, but we can add an argument to ignore missing data and
calculate across the remaining values:

``` r
# add argument to remove NA
mean(heights, na.rm = TRUE)
```

    ## [1] 4

``` r
max(heights, na.rm = TRUE)
```

    ## [1] 6

In the code above, the `na.rm` parameter controls whether missing data
are removed. The default (which you can also reference in the help
documentation) is for missing values to be included (`na.rm = FALSE`).
By switching to `na.rm = TRUE`, we’re instructing R to remove missing
data.

The example above retains missing values in the dataset while performing
calculations. There are certainly cases in which you may want to
specifically filter out the missing data from your dataset.

The function `is.na` allows you to ask whether elements in a dataset are
missing:

``` r
# identify elements which are missing data
is.na(heights)
```

    ## [1] FALSE FALSE FALSE  TRUE FALSE

If a resulting value is `TRUE`, the value is missing. If `FALSE`, the
data point is present. We can invert the resulting logical data using an
exclamation point:

``` r
# reverse the TRUE/FALSE
!is.na(heights)
```

    ## [1]  TRUE  TRUE  TRUE FALSE  TRUE

This means missing data are now listed as `FALSE`, with data present as
`TRUE`.

As with the conditional statements we learned earlier, we can combine
these results with our square bracket subsetting syntax to extract only
values that are present in the dataset:

``` r
# extract elements which are not missing values
heights[!is.na(heights)]
```

    ## [1] 2 4 4 6

Alternatively, you can use a function specifically designed for
excluding (omitting) missing data:

``` r
# remove incomplete cases
na.omit(heights) 
```

    ## [1] 2 4 4 6
    ## attr(,"na.action")
    ## [1] 4
    ## attr(,"class")
    ## [1] "omit"

You may notice that this output looks slightly different than the
previous example. This is because `na.omit` includes output about
attributes, or information about the data. The output vectors are the
same for the last two code examples, even though the way they appear in
the Console seems different.

> If you aren’t sure how to interpret the output in your console,
> sometimes it helps to assign the output to an object. You can then
> inspect the data type, structure, etc to ensure you’re getting the
> answer you expected.

**Exercise:** Complete the following tasks after creating this vector
(Note: there are multiple solutions):

``` r
# create vector
more_heights <- c(63, 69, 60, 65, NA, 68, 61, 70, 61, 59, 64, 69, 63, 63, NA, 72, 65, 64, 70, 63, 65)
```

  - Remove NAs
  - Calculate the median
  - Identify how many elements in the vector are greater than 67 inches
  - Visualize the data as a histogram (hint: function `hist`)

<details>

**<summary>Solution</summary>**

``` r
# option 1: remove NAs from heights using na.omit
more_heights_clean <- na.omit(more_heights)

# option 2: remove NAs from heights by indexing on !is.na
more_heights_clean <- more_heights[!is.na(more_heights)]

# calculate median of heights (multiple answers)
median(more_heights, na.rm = TRUE)
```

    ## [1] 64

``` r
median(more_heights_clean)
```

    ## [1] 64

``` r
# identify how many elements from more_heights are greater than 67 inches (multiple answers)
length(more_heights_clean[more_heights_clean > 67])
```

    ## [1] 6

``` r
sum(more_heights_clean > 67)
```

    ## [1] 6

``` r
sum(more_heights > 67, na.rm=TRUE)
```

    ## [1] 6

``` r
length(which(more_heights > 67))
```

    ## [1] 6

``` r
# visualize data as a histogram (hint: function hist)
hist(more_heights_clean)
```

![](r_intro_files/figure-gfm/unnamed-chunk-47-1.png)<!-- -->

</details>

# Working with data

## Importing spreadsheet-style data into R

In the last section, we recommended organizing your work in directories
(folders) according to projects. While a thorough discussion of project
organization is beyond the scope of this class, we will continue to
model best practices by creating a directory to hold our data:

``` r
# make a directory
dir.create("data")
```

You should see the new directory appear in your project directory, in
the lower right panel in RStudio. There is also a button in that panel
you can use to create a new folder, but including the code to perform
this task makes other people (and yourself) able to reproduce your work
more easily.

Now that we have a place to store our data, we can go ahead and download
the dataset:

``` r
# download data from url
download.file("https://raw.githubusercontent.com/jsfalk/acer_tutorials/master/r_intro/data/animals.csv", "data/animals.csv")
```

The code above has two arguments, both encompassed in quotation marks:
first, you indicate where the data can be found online. Second, you
indicate where R should store a copy of the file on your own computer.

The output from that command may look alarming, but it represents
information confirming it worked. You can click on the `data` folder to
ensure the file is now present.

> The option to “Import Dataset” you see after clicking on the file
> references some additional tools present in RStudio that can assist
> with various kinds of data import. Because this requires installing
> additional software, complete exploration of these options is outside
> the scop of this class. For more information, check out [this
> article](https://support.rstudio.com/hc/en-us/articles/218611977-Importing-Data-with-RStudio).

The data we’ve downloaded are in csv format, which stands for “comma
separated values.” This means the data are organized into rows and
columns, with columns separated by commas.

Now that the data are downloaded, we can import the data and assign to
an object:

``` r
# import data and assign to object
animals <- read.csv("data/animals.csv")
```

You should see `animals` appear in the Environment window on the upper
right panel in RStudio. If you click on `animals` there, a new tab will
appear next to your R script in the Source window.

> Clicking on the name of an object in the Environment window is a
> shortcut for running `View(animals)`; you’ll see this code appear in
> the Console after clicking.

Now that we have the data imported and assigned to an object, we can
take some time to explore the data we’ll be using for the rest of this
course. We are investigating the animal species diversity and weights
found within plots at our study site. Each row holds information for a
single animal, and the columns represent:

| Column           | Description                        |
| ---------------- | ---------------------------------- |
| year             | year of observation                |
| sex              | sex of animal (“M”, “F”)           |
| hindfoot\_length | length of the hindfoot in mm       |
| weight           | weight of the animal in grams      |
| genus            | genus of animal                    |
| species          | species of animal                  |
| taxon            | e.g. Rodent, Reptile, Bird, Rabbit |
| plot\_type       | type of plot                       |

The function we used to import the data is one of a family of commands
used to import the data. Check out the help documentation for `read.csv`
for more options for importing data.

> You can also import data directly into R using `read.csv`, using
> `animals <-
> read.csv("https://raw.githubusercontent.com/jsfalk/acer_tutorials/master/r_intro/data/animals.csv")`.
> For these lessons, we model downloading and importing in two steps, so
> you retain a copy of the data on your computer. This reflects how
> you’re likely to import your own data, as well as recommended
> practice for retaining data used in an analysis (since data online may
> be updated).

## Data frames

Now that we have data imported and available, we can start to inspect
the data more closely.

These data have been interpreted by R to be a data frame, which is a
data structure (way of organizing data) that is analogous to tabular or
spreadsheet style data. By definition, a data frame is a table made of
vectors (columns) of all the same length. As we learned in our last
session, a vector needs to include all of the same type of data (e.g.,
character, numeric). A data frame, however, can include vectors
(columns) of different data types.

To learn more about this data frame, we’ll first explore its dimensions:

``` r
# assess size of data frame
dim(animals)
```

    ## [1] 34786     8

The output reflects the number of rows first (34786), then the number of
columns (8).

We can also preview the content by showing the first few rows:

``` r
# preview first few rows
head(animals) 
```

    ##   year          sex hindfoot_length weight       genus      species   taxa
    ## 1 1983            F              19     28   Onychomys     torridus Rodent
    ## 2 1991 not reported              NA     NA  Amphispiza    bilineata   Bird
    ## 3 1987            F              32    162     Neotoma     albigula Rodent
    ## 4 1995            M              36     44   Dipodomys     merriami Rodent
    ## 5 2002            F              23     15 Chaetodipus penicillatus Rodent
    ## 6 2002            F              22     18 Chaetodipus penicillatus Rodent
    ##                  plot_type
    ## 1 Long-term Krat Exclosure
    ## 2                  Control
    ## 3                  Control
    ## 4                  Control
    ## 5        Spectab exclosure
    ## 6        Spectab exclosure

The default number of rows shown is six. You can specify a different
number using the `n =` parameter, demonstrated below using `tail`, which
shows the last few rows

``` r
# show last three rows
tail(animals, n = 3) 
```

    ##       year sex hindfoot_length weight           genus      species   taxa
    ## 34784 1988   F              37     50       Dipodomys        ordii Rodent
    ## 34785 2001   M              23     17     Chaetodipus penicillatus Rodent
    ## 34786 1995   F              17     18 Reithrodontomys    megalotis Rodent
    ##                       plot_type
    ## 34784                   Control
    ## 34785 Short-term Krat Exclosure
    ## 34786 Short-term Krat Exclosure

We often need to reference the names of columns, so it’s useful to print
only those to the screen:

``` r
# view column names
names(animals) 
```

    ## [1] "year"            "sex"             "hindfoot_length" "weight"         
    ## [5] "genus"           "species"         "taxa"            "plot_type"

It’s also possible to view row names using`rownames(animals)`, but our
data only possess numbers for row names so it’s not very informative.

As we learned last time, we can use `str` to provide a general overview
of the object:

``` r
# show overview of object
str(animals) 
```

    ## 'data.frame':    34786 obs. of  8 variables:
    ##  $ year           : int  1983 1991 1987 1995 2002 2002 1996 1985 1988 1995 ...
    ##  $ sex            : chr  "F" "not reported" "F" "M" ...
    ##  $ hindfoot_length: num  19 NA 32 36 23 22 23 35 17 17 ...
    ##  $ weight         : num  28 NA 162 44 15 18 20 42 10 7 ...
    ##  $ genus          : chr  "Onychomys" "Amphispiza" "Neotoma" "Dipodomys" ...
    ##  $ species        : chr  "torridus" "bilineata" "albigula" "merriami" ...
    ##  $ taxa           : chr  "Rodent" "Bird" "Rodent" "Rodent" ...
    ##  $ plot_type      : chr  "Long-term Krat Exclosure" "Control" "Control" "Control" ...

The output provided includes:

  - data structure: data frame
  - dimensions: 34786 rows and 8 columns
  - column-by-column information: each prefaced with a `$`, and includes
    the column name, data type (num, int, Factor)

> Depending on the version of R you are using, the types of variables
> like “sex” and “genus” may be Factor or chr. We will discuss this in
> greater detail in the intermediate R session.

Finally, we can also examine basic summary statistics for each column:

``` r
# provide summary statistics for each column
summary(animals) 
```

    ##       year          sex            hindfoot_length     weight      
    ##  Min.   :1977   Length:34786       Min.   : 2.00   Min.   :  4.00  
    ##  1st Qu.:1984   Class :character   1st Qu.:21.00   1st Qu.: 20.00  
    ##  Median :1990   Mode  :character   Median :32.00   Median : 37.00  
    ##  Mean   :1990                      Mean   :29.29   Mean   : 42.67  
    ##  3rd Qu.:1997                      3rd Qu.:36.00   3rd Qu.: 48.00  
    ##  Max.   :2002                      Max.   :70.00   Max.   :280.00  
    ##                                    NA's   :3348    NA's   :2503    
    ##     genus             species              taxa            plot_type        
    ##  Length:34786       Length:34786       Length:34786       Length:34786      
    ##  Class :character   Class :character   Class :character   Class :character  
    ##  Mode  :character   Mode  :character   Mode  :character   Mode  :character  
    ##                                                                             
    ##                                                                             
    ##                                                                             
    ## 

For numeric data (such as `weight`), this output includes common
statistics like median and mean, as well as the number of rows
(patients) with missing data (as `NA`). For factors (character data,
such as `genus`), you’re given a count of the number of times the top
six most frequent factors (categories) occur in the data frame.

## Subsetting data frames

Now that our data are available for use, we can begin extracting
relevant information from them.

``` r
# extract first column and assign to a variable
first_column <- animals[1]
```

As discussed last time with vectors, the square brackets (`[ ]`) are
used to subset, or reference part of, a data frame. You can inspect the
output object by clicking on it in the environment. It contains all of
the rows for only the first column.

When a single number is included in the square brackets, R assumes you
are referencing a column. When you include two numbers in square
brackets separated by a comma, R assumes the **first number references
the row** and the **second number references the column** you desire.

This means you can also reference the first column as follows:

``` r
# extract first column
first_column_again <- animals[ , 1]
```

Leaving one field blank means you want the entire set in the output (in
this case, all rows).

**Exercise:** what is the difference in results between the last two
lines of code?

<details>

**<summary>Solution</summary>**

``` r
# animals[1] returns a data.frame with only the first column selected
class(first_column)
```

    ## [1] "data.frame"

``` r
# animals[ , 1] returns an integer vector with values from the first column
class(first_column_again)
```

    ## [1] "integer"

</details>

<p>

</p>

Similarly, we can also extract only the first row across all columns:

``` r
# extract first row 
first_row <- animals[1, ]
```

We can also extract slices, or sections of rows and columns, such as a
single cell:

``` r
# extract cell from first row of first column
single_cell <- animals[1,1]
```

To extract a range of cells, we use the same colon (`:`) syntax from
last time:

``` r
# extract a range of cells, rows 1 to 3, second column
range_cells <- animals[1:3, 2]
```

This works for ranges of columns as well.

We can also exclude particular parts of the dataset using a minus sign:

``` r
# exclude first column
exclude_col <- animals[ , -1] 
```

Combining what we know about R syntax, we can also exclude a range of
cells using the `c` function:

``` r
# exclude first 100 rows
exclude_range <- animals[-c(1:100), ] 
```

So far, we’ve been referencing parts of the dataset based on index
position, or the number of row/column. Because we have included column
names in our dataset, we can also reference columns using those names:

``` r
# extract column by name
name_col1 <- animals["taxa"]
name_col2 <- animals[ , "taxa"]
```

Note the example above features quotation marks around the column name.
Without the quotation marks, R will assume we’re attempting to reference
an object.

As we discussed with subsetting based on index above, the two objects
created above differ in the data structure. `name_col1` is a data frame
(with one column), while `name_col2` is a vector. Although this
difference in the type of object may not matter for your analysis, it’s
useful to understand that there are multiple ways to accomplish a task,
each of which may make particular code work more easily.

There are additional ways to extract columns, which use R specific for
complex data objects, and may be useful to recognize as your R skills
progress.

The first is to use double square brackets:

``` r
# double square brackets syntax
name_col3 <- animals[["taxa"]]
```

You can think of this approach as digging deeply into a complex object
to retrieve data.

The final approach is equivalent to the last example, but can be
considered a shortcut since it requires fewer keystrokes (no quotation
marks, and only one symbol):

``` r
# dollar sign syntax
name_col4 <- animals$taxa
```

Both of the last two approaches above return vectors. For more
information about these different ways of accessing parts of a data
frame, see [this
article](https://www.r-bloggers.com/r-accessors-explained/).

## Exporting data

Once you have performed some data manipulation, you may want to export
the data for future reference or to share with collaborators.
Corresponding to the `read.csv` function we used to load our data, there
is a `write.csv` function to export data. The first argument is the
dataframe to export, and the second argument is the path for the file
that the dataframe will be stored in.

``` r
# Export the data with the first hundred rows excluded
write.csv(exclude_range, "data/animals_subset.csv")
```

## Exercises

The following exercises all use the `animals` object:

**Exercise:** code as many different ways possible to extract the column
“genus”

<details>

**<summary>Solution</summary>**

``` r
animals$genus
animals[5]
animals[,5]
animals[[5]]
animals["genus"] 
animals[ , "genus"] 
animals[["genus"]]
```

</details>

<p>

</p>

**Exercise:** extract the first 6 rows for only hindfoot length and
species.

<details>

**<summary>Solution</summary>**

``` r
animals[1:6, c(3, 6)]
```

    ##   hindfoot_length      species
    ## 1              19     torridus
    ## 2              NA    bilineata
    ## 3              32     albigula
    ## 4              36     merriami
    ## 5              23 penicillatus
    ## 6              22 penicillatus

</details>

<p>

</p>

**Exercise:** calculate the range and mean for weight

<details>

**<summary>Solution</summary>**

``` r
range(animals$weight, na.rm = TRUE)
```

    ## [1]   4 280

``` r
mean(animals$weight, na.rm = TRUE)
```

    ## [1] 42.67243

</details>

<p>

</p>

**Exercise:** Create a `data.frame` (`animals_200`) containing only the
data in row 200 of the `animals` dataset.

<details>

**<summary>Solution</summary>**

``` r
animals_200 <- animals[200, ]
```

</details>

<p>

</p>

**Exercise:** Notice how `nrow()` gave you the number of rows in a
`data.frame`? Use that number to pull out just that last row in
`animals`. Compare that with what you see as the last row using `tail()`
to make sure it’s meeting expectations. Pull out that last row using
nrow() instead of the row number. Create a new data frame
(`animals_last`) from that last row.

<details>

**<summary>Solution</summary>**

``` r
n_rows <- nrow(animals)
animals_last <- animals[n_rows, ]
```

</details>

<p>

</p>

**Exercise:** Use `nrow()` to extract the row that is in the middle of
the data frame. Store the content of this row in an object named
`animals_middle`.

<details>

**<summary>Solution</summary>**

``` r
animals_middle <- animals[n_rows / 2, ]
```

</details>

<p>

</p>

**Exercise:** Combine `nrow()` with the `-` notation above to reproduce
the behavior of `head(animals)`, keeping just the first through 6th rows
of the `animals` dataset.

<details>

**<summary>Solution</summary>**

``` r
animals_head <- animals[-(7:n_rows), ]
```

</details>

# Data manipulation with dplyr

## Installing and loading packages

For this section, we’ll be working with an R package called `dplyr`. A
package is a group of related functions that help you accomplish
particular tasks. `dplyr` is part of
[`tidyverse`](https://www.tidyverse.org), which is a collection of
packages that have been designed specifically to support tasks related
to data science, such as data manipulation, filtering, and
visualization.

The first thing we need to do is install the software:

``` r
# install package 
install.packages("dplyr")
```

A few notes about installing packages:

  - You only need to perform this installation once per computer, or
    when updating R or the package.
  - If you see red text output in the Console during this installation,
    don’t be alarmed: this doesn’t necessarily indicate a problem. You
    are seeing a report of the various pieces of software being
    downloaded and installed.
  - If prompted, you should install all packages (say yes or all), as
    well as yes to compiling any packages
  - When the installation is complete (this may take several minutes),
    you’ll see the command prompt (`>`) in your Console.

Once you have the software installed, you’ll need to load it:

``` r
# load library/package
library(dplyr)
```

    ## Warning: replacing previous import 'vctrs::data_frame' by 'tibble::data_frame'
    ## when loading 'dplyr'

    ## 
    ## Attaching package: 'dplyr'

    ## The following objects are masked from 'package:stats':
    ## 
    ##     filter, lag

    ## The following objects are masked from 'package:base':
    ## 
    ##     intersect, setdiff, setequal, union

Loading packages is similar to opening a software application on your
computer; it makes a previously installed set of software available for
use. A few notes about loading packages:

  - You’ll need to load packages every time you open RStudio (or R
    restarts)
  - The section in the output above referencing “Conflicts” shows you
    which functions you just loaded have names identical to packages you
    already have loaded (in base R). This shouldn’t affect the code we
    write in this lesson, though it’s useful to know the double colon
    syntax (::) allows you to reference functions in a different package
    with same name.

You can check to make sure the new package we’ll be using is available
by executing `?select` in the Console, or by searching for that function
in the help panel. You can also look in the “Packages” tab in the same
panel. If the package (in this case, `dplyr`) is present in the list,
it’s installed. If the box next to the package name is checked, it’s
loaded. In this lesson, if you receive an error saying a function isn’t
available or recognized, check to make sure the package is loaded.

## Selecting columns and rows

First, we can explore selecting certain columns by name:

``` r
# selecting columns with dplyr
sel_columns <- select(animals, sex, weight, taxa)
```

The syntax for the `select` function is to specify the dataset first,
then the names of each of the columns you would like to retain in the
output object. If we look at the object, we’ll see it has only three
columns but all rows.

You’ll note that the column headers don’t require quotation marks; this
is a shortcut programmed into `dplyr` functions.

As with base R functions, we can also select a range of columns:

``` r
# select range of columns
sel_columns2 <- select(animals, sex:taxa)
```

We can also select all columns except certain ones by putting “-” in
front of columns to exclude:

``` r
sel_columns3 <- select(animals, -sex, -hindfoot_length)
```

In addition to these approaches, we can also use other helper functions
for selecting columns: `starts_with()`, `ends_with()`, and `contains()`
are examples that assist in extracting columns with headers that meet
certain conditions. For example, using `starts_with(plot)` in place of
the column names will give you all columns that start with the word plot

We can use a separate function to extract rows that meet particular
conditions:

``` r
# select rows conditionally: keep only rodents
filtered_rows <- filter(animals, taxa == "Rodent") 
```

The syntax here is similar to `select`, and the conditional filters can
be applied in similarly to base R functions.

**Exercise:** create a new object from animals called sex\_taxa that
includes only the sex and taxa columns

<details>

**<summary>Solution</summary>**

``` r
sex_taxa <- select(animals, sex, taxa)
```

</details>

<p>

</p>

**Exercise:** create a new object from sex\_taxa called sex\_Rodent that
includes only Rodent (taxa)

<details>

**<summary>Solution</summary>**

``` r
sex_rodent <- filter(sex_taxa, taxa=="Rodent")
```

</details>

## Combining commands

The last exercises used an intermediate object to obtain an object with
two subsetting methods applied. It’s common in data science to apply
more than one requirement for extracting data. If you want to avoid
creating an intermediate object, you could nest one command inside the
other:

``` r
# same task as exercises, but nested commands 
sex_rodent <- filter(select(animals, sex, taxa), taxa == "Rodent")
```

In this case, `filter(animals, taxa == "Rodent")` becomes the input for
`select`.

While this is a common approach, especially in base R, it can be
difficult for us as coders to read and interpret the code.

One of the most useful features of `dplyr` is its inclusion of a
programming method called pipes. This approach can be found in many
programming languages, in part because of its utility: a pipe sends the
output from the lefthand side of the symbol as the input for the
righthand side. In R, pipes are represented as `%>%`.

We can use pipes to connect the same two data extraction tasks:

``` r
# same task as above, but with pipes
piped <- animals %>%
  select(sex, taxa) %>%
  filter(taxa == "Rodent")
```

The command above starts by naming the object that will result from this
assignment. The dataset is named as the first input. Because executing
the name of an object sends the object contents as output, this means
the second line receives the object as input. The output from the
`select` line is sent as input to the `filter` line. This effectively
demonstrates how pipes can be used to connect multiple commands
together.

> Now that we are running code in chunks that span multiple lines, you
> can see one of the other nice features of RStudio: your cursor can be
> placed on any line of the multi-line chunk when you execute, and the
> entire set of code will run together.

These examples also help highlight the importance of style and
convention in code formatting. After the first line, the code is
indented. While this isn’t necessary for the code to work, it does make
it a lot easier to read and understand the code.

Let’s take a look at another example of piped commands:

``` r
# extract sex and weight from samples before 1995
piped2 <- animals %>%
  filter(year < 1995) %>%
  select(sex, weight)
```

In the code above, we’re applying a mathematical condition to find
specific rows, and the selecting certain columns. Does the order of
commands differ? We can switch the order of the `filter` and `select`
lines to see:

``` r
piped3 <- animals %>%
  select(sex, weight) %>%
  filter(year < 1995)
```

The code above should give you an error, because in this case, the order
does matter\! The output from the second line does not include the
`year_of_birth` column, so R is unable to apply the filter in the third
line.

**Exercise:** Using pipes, subset the `animals` data to include animals
under 5 grams collected before 1995, and retain only the columns `year`,
`sex`, and `weight`.

<details>

**<summary>Solution</summary>**

``` r
animals %>%
  filter(weight < 5) %>%
  filter(year < 1995) %>%
  select(year, sex, weight)
```

    ##    year          sex weight
    ## 1  1982            F      4
    ## 2  1985            M      4
    ## 3  1981 not reported      4
    ## 4  1985            M      4
    ## 5  1985            M      4
    ## 6  1985            M      4
    ## 7  1981            F      4
    ## 8  1985            M      4
    ## 9  1985            F      4
    ## 10 1983            M      4
    ## 11 1985            F      4
    ## 12 1985            M      4
    ## 13 1985            M      4
    ## 14 1977            M      4
    ## 15 1982            F      4

</details>

## Mutate

This lesson so far has mostly shown new ways of accomplishing the same
tasks we learned in the last lesson. `dplyr` includes much more
functionality, however, including the ability to `mutate` columns.
Common tasks for which `mutate` is useful include unit conversions,
transformation, and creating ratios from among existing columns.

We can use this function to convert the `weight` column to kilograms:

``` r
# convert grams to kilograms
animals_kg <- animals %>%
  mutate(weight_kg = weight / 1000)
```

The actual conversion works by providing a formula (`weight / 1000`) and
the name of the new column (`weight_kg`). If you inspect the resulting
object, you’ll see `weight_kg` added as a new column at the end of the
table.

> `mutate` works by retaining all previous columns and creating new
> columns as per the formula specified. `dplyr` also includes
> `transmute`, which drops the existing columns used to calculcate the
> new columns.

We can use `mutate` to perform multiple conversions at once:

``` r
# convert weight to kgs and lbs at same time, and we don't always need to assign to object
animals %>%
  mutate(weight_kg = weight / 1000,
         weight_lb = weight_kg * 2.2) %>%
  glimpse() # preview data output
```

    ## Rows: 34,786
    ## Columns: 10
    ## $ year            <int> 1983, 1991, 1987, 1995, 2002, 2002, 1996, 1985, 1988,…
    ## $ sex             <chr> "F", "not reported", "F", "M", "F", "F", "F", "M", "F…
    ## $ hindfoot_length <dbl> 19, NA, 32, 36, 23, 22, 23, 35, 17, 17, 33, 36, 32, 3…
    ## $ weight          <dbl> 28, NA, 162, 44, 15, 18, 20, 42, 10, 7, 120, 46, 152,…
    ## $ genus           <chr> "Onychomys", "Amphispiza", "Neotoma", "Dipodomys", "C…
    ## $ species         <chr> "torridus", "bilineata", "albigula", "merriami", "pen…
    ## $ taxa            <chr> "Rodent", "Bird", "Rodent", "Rodent", "Rodent", "Rode…
    ## $ plot_type       <chr> "Long-term Krat Exclosure", "Control", "Control", "Co…
    ## $ weight_kg       <dbl> 0.028, NA, 0.162, 0.044, 0.015, 0.018, 0.020, 0.042, …
    ## $ weight_lb       <dbl> 0.0616, NA, 0.3564, 0.0968, 0.0330, 0.0396, 0.0440, 0…

The code above also features a new function, `glimpse`, that can be
useful when developing new piped code. Note that we did not assign the
output above to a new object; we allowed it to be printed to the
Console. Because this is a large dataset, that type of output can be
unweildy. `glimpse` allows us to see a preview of the data, including
the two new columns created.

**Exercise:** Create a new data frame from the surveys data that meets
the following criteria: contains only the `species` column and a new
column called `hindfoot_cm` containing the `hindfoot_length` values
converted to centimeters. In this `hindfoot_cm` column, there are no NAs
and all values are less than 3.

<details>

**<summary>Solution</summary>**

``` r
surveys_hindfoot_cm <- animals %>%
    filter(!is.na(hindfoot_length)) %>%
    mutate(hindfoot_cm = hindfoot_length / 10) %>%
    filter(hindfoot_cm < 3) %>%
    select(species, hindfoot_cm)
```

</details>

## Split-apply-combine

Our `animals` dataset includes categorical (character) data. One example
is the `sex` column. We can assess the different categories available
using a base R function:

``` r
# show categories in sex
unique(animals$sex)
```

    ## [1] "F"            "not reported" "M"

Note that instead of `NA`, missing data for this variable was coded as
the string `"not reported"`. Let’s update the dataframe to use `NA`
using `na_if`, combined with mutate:

``` r
# replace "not reported" with NA
sex_na <- na_if(animals$sex, "not reported")
head(sex_na)
```

    ## [1] "F" NA  "F" "M" "F" "F"

``` r
# update the data frame
animals <- animals %>%
  mutate(sex = na_if(sex, "not reported"))

unique(animals$sex)
```

    ## [1] "F" NA  "M"

`dplyr` includes an approach called split-apply-combine that allows us
to:

  - split data into groups,
  - apply a task for each group,
  - combine the results back together into a single table.

We can try out this approach by counting the number of each sex in our
dataset:

``` r
# count number of individuals of each sex
animals %>%
  group_by(sex) %>%
  tally()
```

    ## # A tibble: 3 x 2
    ##   sex       n
    ##   <chr> <int>
    ## 1 F     15690
    ## 2 M     17348
    ## 3 <NA>   1748

`group_by` is not particularly useful by itself, but powerful together
with a second function like `tally`. The two columns in the resulting
tibble represent the categories from `group_by` and the number of cases
for each sex (n).

An additional function for use with `group_by` is `summarize`:

``` r
# summarize average weight and median hindfoot length by sex
animals %>%
  group_by(sex) %>%
  summarize(mean_weight = mean(weight, na.rm = TRUE),
            median_foot_length = median(hindfoot_length, na.rm = TRUE))
```

    ## `summarise()` ungrouping output (override with `.groups` argument)

    ## # A tibble: 3 x 3
    ##   sex   mean_weight median_foot_length
    ##   <chr>       <dbl>              <dbl>
    ## 1 F            42.2               27  
    ## 2 M            43.0               34  
    ## 3 <NA>         64.7               21.5

Similar to `mutate`, we provide `summarize` with a formula indicating
how we would like the groups to be handled.

In the command above, we use `na.rm = TRUE` to exclude missing data from
the calculation of mean from `days_to_death`. We still have `NA`
reported in the output table, though, because of the `NA` category in
`gender`.

We can apply an additional filter to remove this missing data, prior to
grouping:

``` r
# remove NA
animals %>%
  filter(!is.na(sex)) %>%
  group_by(sex) %>%
  summarize(mean_weight = mean(weight, na.rm=TRUE))
```

    ## `summarise()` ungrouping output (override with `.groups` argument)

    ## # A tibble: 2 x 2
    ##   sex   mean_weight
    ##   <chr>       <dbl>
    ## 1 F            42.2
    ## 2 M            43.0

**Exercise:** Create a data frame called `measurements_complete` from
`animals` that contains no missing data for weight or hindfoot length.

<details>

**<summary>Solution</summary>**

``` r
# option 1: using two filters
measurements_complete <- animals %>%
  filter(!is.na(weight)) %>%
  filter(!is.na(hindfoot_length))

# option 2: using one filter with a boolean operator
measurements_complete <- animals %>%
  filter(!is.na(weight) & !is.na(hindfoot_length))
```

</details>

<p>

</p>

**Exercise:** How many animals were caught in each plot\_type surveyed?

<details>

**<summary>Solution</summary>**

``` r
animals %>%
  count(plot_type) 
```

    ##                   plot_type     n
    ## 1                   Control 15611
    ## 2  Long-term Krat Exclosure  5118
    ## 3          Rodent Exclosure  4233
    ## 4 Short-term Krat Exclosure  5906
    ## 5         Spectab exclosure  3918

</details>

<p>

</p>

**Exercise:** Use `group_by()` and `summarize()` to find the mean, min,
and max hindfoot length for each species. Also add the number of
observations (hint: see `?n`).

<details>

**<summary>Solution</summary>**

``` r
animals %>%
  filter(!is.na(hindfoot_length)) %>%
  group_by(species) %>%
  summarize(
    mean_hindfoot_length = mean(hindfoot_length),
    min_hindfoot_length = min(hindfoot_length),
    max_hindfoot_length = max(hindfoot_length),
    n = n()
  )
```

    ## `summarise()` ungrouping output (override with `.groups` argument)

    ## # A tibble: 22 x 5
    ##    species     mean_hindfoot_length min_hindfoot_length max_hindfoot_leng…     n
    ##    <chr>                      <dbl>               <dbl>              <dbl> <int>
    ##  1 albigula                    32.3                  21                 70  1074
    ##  2 baileyi                     26.1                   2                 47  2864
    ##  3 eremicus                    20.2                  11                 30  1212
    ##  4 flavus                      15.6                   7                 38  1493
    ##  5 fulvescens                  17.5                  15                 20    73
    ##  6 fulviventer                 26.7                  21                 38    41
    ##  7 harrisi                     33                    31                 35     2
    ##  8 hispidus                    28.0                  20                 39   162
    ##  9 intermedius                 22.2                  20                 23     9
    ## 10 leucogaster                 20.5                  12                 39   920
    ## # … with 12 more rows

</details>

<p>

</p>

**Exercise:** What was the heaviest animal measured in each year? Return
the columns `year`, `genus`, `species`, and `weight`.

<details>

**<summary>Solution</summary>**

``` r
animals %>%
  filter(!is.na(weight)) %>%
  group_by(year) %>%
  filter(weight == max(weight)) %>%
  select(year, genus, species, weight) %>%
  arrange(year)
```

    ## # A tibble: 27 x 4
    ## # Groups:   year [26]
    ##     year genus     species     weight
    ##    <int> <chr>     <chr>        <dbl>
    ##  1  1977 Dipodomys spectabilis    149
    ##  2  1978 Neotoma   albigula       232
    ##  3  1978 Neotoma   albigula       232
    ##  4  1979 Neotoma   albigula       274
    ##  5  1980 Neotoma   albigula       243
    ##  6  1981 Neotoma   albigula       264
    ##  7  1982 Neotoma   albigula       252
    ##  8  1983 Neotoma   albigula       256
    ##  9  1984 Neotoma   albigula       259
    ## 10  1985 Neotoma   albigula       225
    ## # … with 17 more rows

</details>

## Filtering data based on number of cases of each type

We’re going to perform one last manipulation on this second dataset for
next time, which will allow us to reduce the total number of species
present in this dataset.

First, we’ll need to count how many examples of each species exist in
the dataset:

``` r
# counting number of records for each species
species_counts <- animals %>%
  count(species) %>%
  arrange(n)
```

The `count` function is similar to `tally`, but doesn’t need to have
`group_by` applied first. The `arrange` function added at the end sorts
the table using the column specified. Although this isn’t necessary for
the analysis to proceed, it makes it easier for us to interpret the
results.

Next, we’ll identify which species are represented by at least 500
examples in this dataset:

``` r
# get names of frequently occurring species
frequent_species <- species_counts %>%
  filter(n >= 500)
```

We can then use this object to filter based on the number of examples:

``` r
# extract data from species to keep
animals_reduced <- animals %>%
  filter(species %in% frequent_species$species)
```

The new syntax here is `%in%`, which allows you to compare each entry in
`species` from `animals` to the species column in `frequent_species`
(remember that `frequent_species$species` means the `species` column
from `frequent_species`). This keeps only cases from the `animals`
dataset that are from species for which we have many examples.

Finally, we’ll write the final output to a file:

``` r
# save results to file in data/ named animals_reduced
write.csv(animals_reduced, "data/animals_reduced.csv")
```

**Exercise:** extract all species with more than 200 examples

<details>

**<summary>Solution</summary>**

``` r
animals %>%
  count(species) %>%
  filter(n > 200)
```

    ##         species     n
    ## 1      albigula  1252
    ## 2       baileyi  2891
    ## 3     bilineata   303
    ## 4      eremicus  1299
    ## 5        flavus  1597
    ## 6       harrisi   437
    ## 7   leucogaster  1006
    ## 8   maniculatus   899
    ## 9     megalotis  2609
    ## 10     merriami 10596
    ## 11        ordii  3027
    ## 12 penicillatus  3123
    ## 13  spectabilis  2504
    ## 14    spilosoma   248
    ## 15     torridus  2249

</details>

<p>

</p>

If you’d like more information on these functions and others available
(including methods of joining multiple tables together), please check
out the [`dplyr`
cheatsheet](https://github.com/rstudio/cheatsheets/raw/master/data-transformation.pdf).

# Wrapping up

## Closing RStudio

**When you are done working in RStudio,** you should save any changes to
your R script. When you close RStudio, you will see a pop-up box asking
if you want to save your workspace image. We do not recommend saving
your project in this way, as it creates extra (hidden) files on your
computer that can be unweildy in size and inadvertently retain sensitive
data (if you’re working with PHI or other private data). If you’ve saved
your R script, you can recreate all the work you’ve accomplished. For
more information on this topic, please review [this
explanation](https://www.stat.ubc.ca/~jenny/STAT545A/block01_basicsWorkspaceWorkingDirProject.html#workspace-.rdata).
If you would like to prevent this box from popping up in the future, we
recommend:

  - Go to `Tools -> Global Options` (Global means for all projects; you
    can also change this for each project using `Project Options`)
  - In the drop-down menu next to `Save workspace to ~/.Rdata on exit`
    select `Never`.

**If you need to reopen your project after closing RStudio,** you should
use the `File -> Open Project` and navigate to the location of your
project directory. Alternatively, using your operating system’s file
browser, double click on the `r_intro.Rrpoj` file.
