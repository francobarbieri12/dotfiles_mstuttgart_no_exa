---
layout: page
title: Home
id: home
permalink: /
---

# Welcome! 🌱

This is my personal wiki where I share everything I know about this world in form of an online wiki built with Jekill.

Where I take notes (both public and private), so that I can:\

* Remember things that aren't important right now and I know I'll forgot
* Publish them online so that others can benefit from my research and learnings

This digital garden is based on this digital garden jekyll template. The static html files are deployed using Github pages. I’m editing my markdown files using Obsidian, but any text editor will do.

<strong>Recently updated notes</strong>

<ul>
  {% assign recent_notes = site.notes | sort: "last_modified_at_timestamp" | reverse %}
  {% for note in recent_notes limit: 5 %}
    <li>
      {{ note.last_modified_at | date: "%Y-%m-%d" }} — <a class="internal-link" href="{{ note.url }}">{{ note.title }}</a>
    </li>
  {% endfor %}
</ul>

<style>
  .wrapper {
    max-width: 46em;
  }
</style>
