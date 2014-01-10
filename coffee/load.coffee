console.log "now loading..."
$.ajax
  type: 'GET'
  # url: './data/timetable201310.xml'
  url: 'http://www.akashi.ac.jp/data/timetable/timetable201310.xml'
  dataType: 'xml'
  success: (xml) ->
    lectures = _.map $(xml).find('Lecture'), (l) -> new Lecture(l)
    _.each lectures, (l) ->
      for i in [1..4]
        $("##{l.eDept()}#{l.eCourse()}#{l.grade}+dd").append "#{i}. <strong>#{l.name}</strong> ＠#{l.location}<br>" if l.isToday() && l.isPeriod(i)

