// Generated by CoffeeScript 1.6.3
var Lecture;

Lecture = (function() {
  function Lecture(xml) {
    this.name = $(xml).find('Name').text();
    this.grade = $(xml).find('Grade').text();
    this.department = $(xml).find('Department').text();
    this.course = $(xml).find('Course').text() || "";
    this.wday = $(xml).find('Wday').text();
    this.startTime = moment($(xml).find('StartTime').text(), 'HH:mm:ss');
    this.endTime = moment($(xml).find('EndTime').text(), 'HH:mm:ss');
    this.location = $(xml).find('Location').text();
    this.lecturers = _.map($(xml).find('Lecturer'), function(l) {
      return $(l).text();
    });
  }

  Lecture.prototype.isDept = function(dept) {
    return this.eDept() === dept;
  };

  Lecture.prototype.isCourse = function(course) {
    return this.eCourse === course;
  };

  Lecture.prototype.eDept = function() {
    switch (this.department) {
      case '機械工学科':
        return 'm';
      case '電気情報工学科':
        return 'e';
      case '都市システム工学科':
        return 'c';
      case '建築学科':
        return 'a';
      case '機械・電子システム工学専攻':
        return 'me';
      case '建築・都市システム工学専攻':
        return 'ac';
    }
  };

  Lecture.prototype.eCourse = function() {
    if (this.course.length === 0) {
      return "";
    }
    if (this.eDept() === 'e') {
      switch (this.course) {
        case '電気電子工学コース':
          return 'd';
        case '情報工学コース':
          return 'j';
      }
    }
  };

  Lecture.prototype.isToday = function() {
    return this.isWday(moment().day());
  };

  Lecture.prototype.isWday = function(wday) {
    return +wday === +this.wday;
  };

  Lecture.prototype.isPeriod = function(period) {
    switch (period) {
      case 1:
        return this.startTime.isSame(moment("09:00:00+0900", "HH:mm:ss")) || this.endTime.isSame(moment("10:30:00+0900", "HH:mm:ss"));
      case 2:
        return this.startTime.isSame(moment("10:40:00+0900", "HH:mm:ss")) || this.endTime.isSame(moment("12:10:00+0900", "HH:mm:ss"));
      case 3:
        return this.startTime.isSame(moment("13:00:00+0900", "HH:mm:ss")) || this.endTime.isSame(moment("14:30:00+0900", "HH:mm:ss"));
      case 4:
        return this.startTime.isSame(moment("14:40:00+0900", "HH:mm:ss")) || this.endTime.isSame(moment("16:10:00+0900", "HH:mm:ss"));
    }
  };

  return Lecture;

})();
