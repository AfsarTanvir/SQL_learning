-- Hecker Rank Easy Basic
-- https://www.hackerrank.com/challenges/binary-search-tree-1/problem?isFullScreen=true
-- Binary Tree Nodes

SELECT b1.N, 
    CASE
        WHEN b1.P is null THEN 'Root'
        WHEN b1.N IN (SELECT DISTINCT b2.P FROM BST AS b2) THEN 'Inner'
        ELSE 'Leaf'
    END
FROM BST AS b1 
ORDER BY b1.N;

-- SELECT DISTINCT b2.P, b2.N FROM BST AS b2
