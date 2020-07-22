---
title: "Artefacts, Archiving, and Reuse"
date: 2020-02-17 12:00:00
tags: [academia, artefact evaluation]
---

I’d like to monologue for a bit about conference papers, submitting artefacts, and artefact evaluation committees (AECs). I’ve been on a lot of AECs: I’ve been on every IFCP AEC since they started doing them in 2017, I was on the OOPSLA’19 AEC[^OOPSLA], and on the POPL’20 AEC. I’m not bragging[^SADBRAG], I’m just trying to say… what’s a culturally appropriate way for me to say this isn’t my first rodeo?
Anyway, I’d like to give you my take on artefacts. Why are they important? What makes a good artefact? Why do I keep spelling it “artefact” when clearly it’s “artifact”?[^ARTEFACT]

## Artefacts. What’s the point?

When you write a paper, you probably create a bunch of things that don’t directly end up in the paper: software, proofs, models, test suites, benchmarks, etc. All of these are artefacts, and they’re very important: they prove that what you say in your paper is actually true,[^REPRODUCIBILITY][^HONESTY] can be hugely valuable to someone building on your work, and foster collaboration. Unfortunately, most academics get paid to write and publish papers, not software. The result? Lots of software written by academics are gems of novelty, but lack documentation, and rapidly bitrot into oblivion. Those that don’t are usually kept alive by free labour or on research time. It’s hard work, polishing and maintaining software.

That’s where AECs come in! There’s [a two-fold goal][artifact-eval] to artefact evaluation.
First and foremost, the goal is “to reward authors who take the trouble to create useful artifacts beyond the paper.”
The second goal is to cause “radical shift in our conference evaluation processes”, where “the AEC will inform and advise the Program Committee.” We’re currently in the middle of this shift: it happens that reviewers to cite the lack of an artefact as grounds for rejection, but artefacts—if one is present—usually aren’t inspected by reviewers, and the AEC does not have the power to reject a paper.

## How It’s Made: Artefacts

Every conference has its own guidelines for artefacts, and every guideline has a degree to which it’s actually enforced—probably varying from reviewer to reviewer[^VARIANCE]. For some consistency, let’s look at what [artifact-eval.org][artifact-eval] has to say:

{:.blockquote-alignleft}
> “Ultimately, we expect artifacts to be:
> - consistent with the paper,
> - as complete as possible,
> - documented well, and
> - easy to reuse, facilitating further research.”
> {:.compact-list}


---

[^OOPSLA]: Unfortunately, I had to resign for health and accessibility reasons, which we’ll get into.
[^SADBRAG]: To be honest, “Look at all the free labour I performed” is a pretty sad brag.
[^ARTEFACT]: The answer is that my spell checker is stuck on UK English, and I don’t know how to change it.
[^REPRODUCIBILITY]: *Mutters something about verification and reproducibility.*
[^HONESTY]: "Conversely, authors sometimes take liberties in describing the status of their artifacts—claims they would temper if they knew the artifacts are going to be scruitinized. This leads to more accurate reporting.“ —[artifact-eval.org][artifact-eval]
[^VARIANCE]: Caveat: <script type="math/tex">N = 1</script>
[artifact-eval]: https://www.artifact-eval.org/about.html
