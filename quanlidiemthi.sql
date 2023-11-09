CREATE DATABASE QUANLYDIEMTHI;
USE QUANLYDIEMTHI;

CREATE TABLE STUDENT (
    studentId VARCHAR(4) NOT NULL PRIMARY KEY ,
    studentName VARCHAR(100) NOT NULL ,
    birthday DATE NOT NULL ,
    gender BIT(1) NOT NULL ,
    address TEXT NOT NULL ,
    phoneNumber VARCHAR(45)
);

CREATE TABLE SUBJECT (
    subjectId VARCHAR(4) NOT NULL PRIMARY KEY ,
    subjectName VARCHAR(45) NOT NULL ,
    priority INT(11) NOT NULL
);

CREATE TABLE MARK (
    subjectId VARCHAR(4) NOT NULL ,
    studentId VARCHAR(4) NOT NULL ,
    point FLOAT NOT NULL,
    CONSTRAINT FK_SUBJECT FOREIGN KEY (subjectId) REFERENCES SUBJECT (subjectId),
    CONSTRAINT FK_STUDENT FOREIGN KEY (studentId) REFERENCES STUDENT (studentId)
);



# Bài 2: Thêm , sửa , xoá dữ liệu
INSERT INTO STUDENT (studentId, studentName, birthday, gender, address, phoneNumber)
VALUES ('S001','Nguyễn Thế Anh','1999-01-11',1,'Hà Nội','984678082'),
       ('S002','Đặng Bảo Trâm','1998-12-22',0,'Lào Cai','904982654'),
       ('S003','Trần Hà Phương','2000-05-05',0,'Nghệ An','947645363'),
       ('S004','Đỗ Tiến Mạnh','1999-3-26',1,'Hà Nội','983665353'),
       ('S005','Phạm Duy Nhất','1998-10-04',1,'Tuyên Quang','987242678'),
       ('S006','Mai Văn Thái','2002-6-26',1,'Nam Định','982654268'),
       ('S007','Giang Gia Hân','1996-11-10',0,'Phú Thọ','982364753'),
       ('S008','Nguyễn Ngọc Bảo My','1999-01-22',0,'Hà Nam','984567264'),
       ('S009','Nguyễn Tiến Đạt','1998-08-07',1,'Tuyên Quang','986345621'),
       ('S010','Nguyễn Thiều Quang','2000-09-18',1,'Hà Nội','9846325761');

INSERT INTO SUBJECT
    VALUES ('MH01', 'Toán', 2),
           ('MH02', 'Vật Lý', 2),
           ('MH03', 'Hoá Học', 1),
           ('MH04', 'Ngữ Văn', 1),
           ('MH05', 'Tiếng Anh', 2);



INSERT INTO MARK
    VALUES ('MH01', 'S001', 8.5),
           ('MH02', 'S001', 7),
           ('MH03', 'S001', 9),
           ('MH04', 'S001', 9),
           ('MH05', 'S001', 5),

           ('MH01', 'S002', 9),
           ('MH02', 'S002', 8),
           ('MH03', 'S002', 6.5),
           ('MH04', 'S002', 8),
           ('MH05', 'S002', 6),

           ('MH01', 'S003', 7.5),
           ('MH02', 'S003', 6.5),
           ('MH03', 'S003', 8),
           ('MH04', 'S003', 7),
           ('MH05', 'S003', 7),

           ('MH01', 'S004', 6),
           ('MH02', 'S004', 7),
           ('MH03', 'S004', 5),
           ('MH04', 'S004', 6.5),
           ('MH05', 'S004', 8),

           ('MH01', 'S005', 5.5),
           ('MH02', 'S005', 8),
           ('MH03', 'S005', 7.5),
           ('MH04', 'S005', 8.5),
           ('MH05', 'S005', 9),

           ('MH01', 'S006', 8),
           ('MH02', 'S006', 10),
           ('MH03', 'S006', 9),
           ('MH04', 'S006', 7.5),
           ('MH05', 'S006', 6.5),

           ('MH01', 'S007', 9.5),
           ('MH02', 'S007', 9),
           ('MH03', 'S007', 6),
           ('MH04', 'S007', 9),
           ('MH05', 'S007', 4),

           ('MH01', 'S008', 10),
           ('MH02', 'S008', 8.5),
           ('MH03', 'S008', 8.5),
           ('MH04', 'S008', 6),
           ('MH05', 'S008', 9.5),

           ('MH01', 'S009', 7.5),
           ('MH02', 'S009', 7),
           ('MH03', 'S009', 9),
           ('MH04', 'S009', 5),
           ('MH05', 'S009', 10),

            ('MH01', 'S010', 6.5),
            ('MH02', 'S010', 8),
            ('MH03', 'S010', 5.5),
            ('MH04', 'S010', 4),
            ('MH05', 'S010', 7);

-- Sửa tên sinh viên có mã `S004` thành “Đỗ Đức Mạnh”.
UPDATE STUDENT SET studentName = 'Đỗ Đức Mạnh' WHERE studentId = 'S004';

-- Sửa tên và hệ số môn học có mã `MH05` thành “NgoạiNgữ” và hệ số là 1.
UPDATE SUBJECT SET subjectName = 'NgoạiNgữ', priority = 1 WHERE subjectId = 'MH05';

-- Cập nhật lại điểm của học sinh có mã `S009` thành (MH01 : 8.5, MH02 : 7,MH03 : 5.5, MH04 : 6, MH05 : 9).
UPDATE MARK
SET point = 8.5 WHERE studentId = 'S009' AND subjectId = 'MH01';
UPDATE MARK
SET point = 7 WHERE studentId = 'S009' AND subjectId = 'MH02';
UPDATE MARK
SET point = 5.5 WHERE studentId = 'S009' AND subjectId = 'MH03';
UPDATE MARK
SET point = 6 WHERE studentId = 'S009' AND subjectId = 'MH04';
UPDATE MARK
SET point = 9 WHERE studentId = 'S009' AND subjectId = 'MH05';


-- Xoá toàn bộ thông tin của học sinh có mã `S010` bao gồm điểm thi ở bảng MARK và thông tin học sinh này ở bảng STUDENT.
DELETE FROM MARK WHERE studentId = 'S010';
DELETE FROM STUDENT WHERE studentId = 'S010';



# Bài 3: Truy vấn dữ liệu :
-- Lấy ra tất cả thông tin của sinh viên trong bảng Student
SELECT * FROM STUDENT;

-- Hiển thị tên và mã môn học của những môn có hệ số bằng 1.
SELECT subjectId, subjectName FROM SUBJECT WHERE priority = 1;

-- Hiển thị thông tin học sinh bào gồm: mã học sinh, tên học sinh, tuổi (bằng năm hiện tại trừ năm sinh)
 -- , giới tính (hiển thị nam hoặc nữ) và quê quán của tất cả học sinh.
SELECT
    studentId,
    studentName,
    TIMESTAMPDIFF(YEAR, birthday, CURDATE()) AS Age,
    CASE WHEN gender = 1 THEN 'Nam' ELSE 'Nữ' END AS Gender,
    address
FROM STUDENT;

-- Hiển thị thông tin bao gồm: tên học sinh, tên môn học , điểm thi của tất cả học sinh của môn Toán và sắp xếp theo điểm giảm dần.
SELECT
    s.studentName,
    s2.subjectName,
    m.point
FROM STUDENT s JOIN MARK m ON s.studentId = m.studentId
                JOIN SUBJECT s2 on m.subjectId = s2.subjectId
WHERE m.subjectId = 'MH01' ORDER BY m.point DESC ;

-- Thống kê số lượng học sinh theo giới tính ở trong bảng (Gồm 2 cột: giới tính và số lượng).
SELECT
    CASE WHEN s.gender = 1 THEN 'Nam' ELSE 'Nữ' END AS Gender,
    COUNT(studentId) AS Soluong
FROM STUDENT s GROUP BY s.gender;

-- Tính tổng điểm và điểm trung bình của các môn học theo từng học sinh (yêu cầu sử dụng hàm để tính toán) ,
-- bảng gồm mã học sinh, tên hoc sinh, tổng điểm và điểm trung bình.
SELECT
    s.studentId AS 'Mã học sinh',
    s.studentName AS 'Tên học sinh',
    SUM(m.point) AS 'Tổng điểm',
    AVG(m.point) AS 'Điểm trung bình'
FROM STUDENT s JOIN MARK m ON s.studentId = m.studentId
GROUP BY s.studentId;


# Bài 4: Tạo View, Index, Procedure
-- Tạo VIEW có tên STUDENT_VIEW lấy thông tin sinh viên bao gồm : mã học sinh, tên học sinh, giới tính , quê quán .

CREATE VIEW STUDENT_VIEW AS
SELECT s.studentId,
       s.studentName,
       CASE WHEN s.gender = 1 THEN 'Nam' ELSE 'Nữ' END AS Gender,
       s.address
       FROM STUDENT s;
SELECT * FROM STUDENT_VIEW;

-- Tạo VIEW có tên AVERAGE_MARK_VIEW lấy thông tin gồm:mã học sinh, tên học sinh, điểm trung bình các môn học .
CREATE VIEW AVERAGE_MARK_VIEW AS
SELECT
    s.studentId AS 'Mã học sinh',
    s.studentName AS 'Tên học sinh',
    AVG(m.point) AS 'Điểm trung bình'
FROM STUDENT s JOIN MARK m ON s.studentId = m.studentId
GROUP BY s.studentId;
SELECT * FROM AVERAGE_MARK_VIEW;

-- Đánh Index cho trường `phoneNumber` của bảng STUDENT.
CREATE INDEX idx_phoneNumber ON STUDENT(phoneNumber);   

-- Tạo PROC_INSERTSTUDENT dùng để thêm mới 1 học sinh bao gồm tất cả thông tin học sinh đó.
DELIMITER &&
CREATE PROCEDURE PROC_INSERTSTUDENT
    (
    IN p_studentId VARCHAR(4),
    IN p_studentName VARCHAR(100),
    IN p_birthday DATE,
    IN p_gender BIT(1),
    IN p_address TEXT,
    IN p_phoneNumber VARCHAR(45)
)
BEGIN
    INSERT INTO STUDENT (studentId, studentName, birthday, gender, address, phoneNumber)
    VALUES (p_studentId, p_studentName, p_birthday, p_gender, p_address, p_phoneNumber);
end &&
DELIMITER ;
-- gọi pro
CALL PROC_INSERTSTUDENT('S011','Đào Xuan Nam','1999-05-11',1,'Hà Nội','984678082');

-- Tạo PROC_UPDATESUBJECT dùng để cập nhật tên môn học theo mã môn học.
DELIMITER &&
CREATE PROCEDURE PROC_UPDATESUBJECT(
    IN p_subjectId VARCHAR(4),
    IN p_newSubjectName VARCHAR(45)
)
BEGIN
    UPDATE SUBJECT
    SET subjectName = p_newSubjectName
    WHERE subjectId = p_subjectId;
end &&
DELIMITER ;


