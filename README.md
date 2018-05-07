# University of Malta -- LaTeX Dissertation Template

Let us not waste any time, you have a project to write up!  This LaTeX template looks like [this](https://github.com/jp-uom/university_of_malta_LaTeX_dissertation_template/blob/master/dissertation_main.pdf).  Now back to the boring bits ...

A modern, highly configurable assignment/project/fyp/dissertation/thesis template for the University of Malta.  (In reality, there is nothing specific to the University of Malta, and this LaTeX class may be used anywhere).  This template is loosely based on my D.Phil. Thesis at the University of Oxford, which was loosely based on ...  You get the drift.

This template was clearly needed, as I keep correcting/examining poorly and inconsistently formatted dissertations all the time.  Updates to the template with examples (2-page landscape table anyone?) are greatly appreciated -- either through pull requests, github issues or emails (jean.p.ebejer@um.edu.mt). 

The main file is `dissertation_main.tex`, and this will show you how to organise your dissertation.  Basically replace all `\blindtext` commands with your content and you are.  This is obviously a case of something more easily said than done.

I am also keen on keeping an FAQ with the most common LaTeX problems, which you are bound to face on the night before your submission deadline.

## FAQ

### What is the difference (if any) between a thesis and a dissertation?

> University of Malta regulations specify a thesis only in case of PhD, and SThD degrees.  In all other cases it is a dissertation.

Bet you didn't know this one bit of academic trivia!  (Note: The answer is specific to the University of Malta, answer given by our dear registrar, Ms Veronica Grech).

### I am a foe of the environment, and don't want to double side print -- how do I fix this?

Well, first of all, **you moron**.  Secondly, by default the template uses two-sided printing settings (margins, recto openings for chapters, table of contents,  etc.).  If you want to change that, simply pass `oneside` as an option to the document class (as opposed to `twoside`).  I suggest you use double-sided layout and printing when you print the examiner's copy (we hate carrying thick manuscripts around) and single sided when you've handed in your corrections, and given out your final copies (to the library, to your supervisors, etc.).


