COMP 491 - Computer Engineering Design Project
==============================================

Implementation of a small scale search engine for Koç University subdomains.

Index
-----
- `Design`_
- `Results`_
- `References`_

.. |data| image:: docs/images/data.png
.. |database| image:: docs/images/database.png
.. |model| image:: docs/images/model.png

Design
------
|model|

- C# Offline Crawler
    Crawls webpages with a breadth first search approach for two levels and extracts data.
- Microsoft SQL Server Database
    Stores pages and their ranks calculated with the PageRank algorithm, links between pages and keywords contained in pages. Schema of the database is visualiazed as follows. |database|
- ASP.NET Web Interface
    Interacts with the database to display results of search queries to the user.

Results
-------
Offline crawling takes about 30 minutes. Data in the database is distributed as in the graph.

|data|

References
----------
.. [#] \R. Tanase, R. Radu. PageRank Algorithm - The Mathematics of Google Search. 2015. http://www.math.cornell.edu/~mec/Winter2009/RalucaRemus/Lecture3/lecture3.html
.. [#] \I. Rogers. The Google Pagerank Algorithm and How It Works. 2015. http://www.cs.princeton.edu/~chazelle/courses/BIB/pagerank.htm
