Create procedure spInsertIntoStudentCourses 
@StudentName nvarchar(50),
@CourseName nvarchar(50)
as
Begin

 Declare @StudentId int
 Declare @CourseId int

 Select @StudentId = Id from Students where StudentName = @StudentName
 Select @CourseId = Id from Courses where CourseName = @CourseName

 If (@StudentId is null)
 Begin
  Insert into Students values(@StudentName)
  Select @StudentId = SCOPE_IDENTITY()
 End

 If (@CourseId is null)
 Begin
  Insert into Courses values(@CourseName)
  Select @CourseId = SCOPE_IDENTITY()
 End

 Insert into StudentCourses values(@StudentId, @CourseId)

End

Use the following statement to execute the stored procedure
Execute spInsertIntoStudentCourses 'Tom','C#'