# Preamble

Before embarking on this journey, I suggest you read my [LaTeX](https://bitsilla.com/blog/2019/01/latex-tips-for-your-dissertation-or-project-write-up/) and [content](https://bitsilla.com/blog/2019/03/content-tips-for-your-dissertation-or-project-write-up/) tips.

# University of Malta &ndash; LaTeX Dissertation (or Thesis) Template

Let us not waste any time, you have a project to write up!  [Here](https://github.com/jp-um/university_of_malta_LaTeX_dissertation_template/blob/master/dissertation_main.pdf) is a complete example (PDF format) of what this LaTeX template looks like.  Or quicker...

<img src="images/pg1.png" width="400"><img src="images/pg2.png" width="400">
<img src="images/pg3.png" width="400"><img src="images/pg4.png" width="400">

Now back to the boring bits ...

A modern, highly configurable assignment/project/fyp/dissertation/thesis template for the University of Malta.  (In reality, there is nothing specific to the University of Malta, and this LaTeX class may be used anywhere).  This template is loosely based on my D.Phil. Thesis at the University of Oxford, which was loosely based on ...  You get the drift.

This template was clearly needed, as I keep correcting/examining poorly and inconsistently formatted dissertations all the time.  Updates to the template with examples (2-page landscape table anyone?) are greatly appreciated -- either through pull requests, github issues or emails (jean.p.ebejer@um.edu.mt).

The main file is `dissertation_main.tex`, and this will show you how to organise your dissertation.  Basically replace all `\blindtext` commands with your content and you are there, ready to print.  This is obviously a case of something more easily said than done.

I am also keen on keeping an FAQ with the most common LaTeX problems, which you are bound to face on the night before your submission deadline.

# Requirements

For this template you will need the beautiful Lato font for headings.  This sans font creates a pleasing contrast with the serif text.  `lato.sty` can be installed (on Ubuntu) with:

```
sudo apt install texlive-fonts-extra
```

## FAQ

### What is the difference (if any) between a thesis and a dissertation?

> University of Malta regulations specify a thesis only in case of PhD, and SThD degrees.  In all other cases it is a dissertation.

Bet you didn't know this one bit of academic trivia!  (Note: The answer is specific to the University of Malta, answer given by our dear registrar, Ms Veronica Grech).

### May I use this template for my assignment?  What changes do I need?

You must, not should!  You should view any written submission as a training opportunity for your final dissertation.  Getting familiar with the template will help you out later in the course.  Of course, some (very) minor changes to the template are required; as follows:

- From `dissertation_main.tex` comment out (`%`) frontmatter sections for originality, dedication, acknowledgements, and abstract (these would look silly in an assignment).  
- Also, from the same file `dissertation_main.tex` comment out all the appendix material (unless you actually have an appendix; unlikely)

(Let me know if any more changes are required)

### But how do I use (build) this?

Well, this is the sort of thing your supervisor would expect you to find out on your own.  However, you can either use a GUI like ~~TexMaker (this is what I use) or~~ TexStudio.  Or if you are so inclined, to build your document from the command line (in the directory where `dissertation_main.tex` resides):

```
latexmk -pdf
```

This generates a lot of clutter, but it is important to go through it as some warnings can give you valuable insight on stuff to fix for a perfect presentation. To clean all the LaTeX generated files:

```
latexmk -c
```

Note that this will leave the generated `pdf` file, as is desirable most of the cases.

### I am a foe of the environment, and don't want to double side print -- how do I fix this?

Well, first of all, **you moron**.  Secondly, by default the template uses two-sided printing settings (margins, recto openings for chapters, table of contents,  etc.).  If you want to change that, simply pass `oneside` as an option to the document class (as opposed to `twoside`).  I suggest you use double-sided layout and printing when you print the examiner's copy (we hate carrying thick manuscripts around) and single sided when you've handed in your corrections, and given out your final copies (to the library, to your supervisors, etc.).

### Why are there so many blank pages?

First, blank pages are only generated with the `twopage` option.  This is because typesetters don't start new chapters (and abstracts/acknowledgements/etc.) on the *verso* side (left in the western-world) when using both sides of the paper.  Chapters start on the *recto* side (right), so an empty page is inserted if the chapter start falls on the *verso* side (left).  The `onepage` option clearly has no empty pages (or has blank pages at the back of each paper, so every *verso* page is empty).  Note that the page margins are different for the *recto* and *verso* sides in the `twopage` option, this is because of the spline (which is on the right for *verso* and left for *recto*).  I hope this is clear, I am an amateur typesetter.

### My supervisor(s) says section X should be named Y.  What should I do?

It is always counter-productive to **not** listen to your supervisor.  This is a generic template, and your specific use-case may have different requirements.  For example, in some departments it is common to have a "Methodology" section instead of the (more experimental) "Materials & Methods".  Elsewhere, the "Evaluation" section is sometimes merged in the "Results and Discussion" chapter.  Some faculties require a standard cover page.  This template is very flexible, and any changes are easy/trivial to make.  The important thing is to use good judgement and that **you follow your supervisor's advice**.

### For references, which is better [42] or [Ebejer et al., 2022]?

Many computational scientists are used to the IEEE referencing style with numbers, i.e. `[42]`.  But there is a reason why `plannat`, or similar, is superior.  Your examiners (and supervisors) will be well acquainted with the research area and will know which are the main papers you should have read (and cited).  If you use numbered referencing, the examiner has to keep cross-referencing the *References* section.  This is not the case when using the name of the author and year directly in the citation.  Moreover, it is easier for the examiner to realize when you are mis-citing an author.  Modern typesetting is moving in this direction.

### I have a huge figure which takes up all the page.  I would like to switch off headers and the bottom page numbers, but ```\thispagestyle{empty}``` does nothing (or changes some other page).

The template uses the ```floatpag``` package.  All you need to do is place a ```\thisfloatpagestyle{empty}``` inside the figure or table environment.  Et voilà!  There is an example of this [here](https://github.com/jp-um/university_of_malta_LaTeX_dissertation_template/blob/master/chap2/background_and_lit_overview_main.tex).

### How do I write good Latex Mathematical Notation/Formulae?

The [Math on Quora](https://math-on-quora.surge.sh/) is all you need. Any math notation you might need is available conveniently in the menu bar. All examples contain live code blocks so you can try out your math formulae directly in the web browser.
