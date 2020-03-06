---
layout: page
title: mothur's blog
permalink: /blog/
---

<h1 style="margin-bottom:10px">{{ page.title }}</h1>

mothur is designed to help scientists to curate and analyze their 16S rRNA gene sequences. Frequently, there will be questions that come up where it would be helpful to demonstrate various concepts and processes. The code presented in this blog represents commands from mothur as well as in R. Here are some of the things we'll cover at the blog...

* Demo new features that have been incorporate into mothur
* Describe how reference files were generated
* Test ideas being bandied about in the literature
* Respond to common or good questions that you email us

Another goal is to engage the community in a framework that supports reproducible science. These blog posts are not written as much as they are executed to generate their results. You can download all of the source code used to build this site at [our github repository](https://github.com/mothurblog/mothurblog.github.io). There you can fork the repository and play around with our code to test various assumptions and modify the code to suit your needs.

Want to older posts? See the <a href="{{ site.baseurl }}/archive/">archive</a>. Feel free to reach out to us if you have any questions!

---

<ul class="post-preview">
  {% for post in site.posts limit: 5 %}
    <li>
      <span class="post-date">{{ post.date | date: "%b %-d, %Y" }}</span>
      <a class="post-link" href="{{ post.url | prepend: site.baseurl }}">{{ post.title }}</a>
			{% if post.blurb != nil %}
			<p>{{ post.blurb }}</p>
			{% else %}
		      {{ post.excerpt }}
			{% endif %}
    </li>
  {% endfor %}
</ul>



Subscribe with <a href="{{ site.baseurl }}/feed.xml">RSS</a> to keep up with the latest news.
