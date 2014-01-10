class Lecture
  constructor: (xml) ->
    @name = $(xml).find('Name').text()
    @grade = $(xml).find('Grade').text()
    @department = $(xml).find('Department').text()
    @course = $(xml).find('Course').text() || ""
    @wday = $(xml).find('Wday').text()
    @startTime = moment $(xml).find('StartTime').text(), 'HH:mm:ss'
    @endTime = moment $(xml).find('EndTime').text(), 'HH:mm:ss'
    @location = $(xml).find('Location').text()
    @lecturers = _.map $(xml).find('Lecturer'), (l) -> $(l).text()

  isDept: (dept) -> @eDept() == dept

  isCourse: (course) -> @eCourse == course

  eDept: ->
    switch @department
      when '機械工学科' then return 'm'
      when '電気情報工学科' then return 'e'
      when '都市システム工学科' then return 'c'
      when '建築学科' then return 'a'
      when '機械・電子システム工学専攻' then return 'me'
      when '建築・都市システム工学専攻' then return 'ac'

  eCourse: ->
    return "" if @course.length == 0
    if @eDept() == 'e'
      switch @course
        when '電気電子工学コース' then 'd'
        when '情報工学コース' then 'j'

  isToday: -> @isWday moment().day()

  isWday: (wday) -> +wday == +@wday

  isPeriod: (period) ->
    switch period
      when 1
        return @startTime.isSame(moment("09:00:00+0900", "HH:mm:ss")) || @endTime.isSame(moment("10:30:00+0900", "HH:mm:ss"))
      when 2
        return @startTime.isSame(moment("10:40:00+0900", "HH:mm:ss")) || @endTime.isSame(moment("12:10:00+0900", "HH:mm:ss"))
      when 3
        return @startTime.isSame(moment("13:00:00+0900", "HH:mm:ss")) || @endTime.isSame(moment("14:30:00+0900", "HH:mm:ss"))
      when 4
        return @startTime.isSame(moment("14:40:00+0900", "HH:mm:ss")) || @endTime.isSame(moment("16:10:00+0900", "HH:mm:ss"))

