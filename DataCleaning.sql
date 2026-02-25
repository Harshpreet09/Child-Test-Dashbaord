SELECT *
FROM child_register;

SELECT *
FROM location_master;

SELECT *
FROM child_test_score;

------------------- Query for Age Calculation Only----------------
SELECT 
    registration_no,
    dob,
    DATEDIFF(YEAR, dob, GETDATE()) AS age
FROM child_register;

----------------- Query for Total Score Only----------------------
SELECT 
    registration_no,
    (ISNULL(hindi,0) +
     ISNULL(english,0) +
     ISNULL(math,0) +
     ISNULL(science,0)) AS total_score
FROM child_test_score;

------------------Query to Join Child + Location Only-------------
SELECT 
    cr.registration_no,
    cr.name,
    lm.district,
    lm.block,
    lm.village
FROM child_register cr
LEFT JOIN location_master lm
ON cr.village_code = lm.village_code;
----------------Query to Join Child + Test Score Only------------
SELECT 
    cr.registration_no,
    cr.name,
    cts.hindi,
    cts.english,
    cts.math,
    cts.science
FROM child_register cr
LEFT JOIN child_test_score cts
ON cr.registration_no = cts.registration_no;
   