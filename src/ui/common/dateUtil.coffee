root.getDayOfWeekString = (thisDate)->
  thisDay = thisDate.getDay()
  switch thisDay
    when 1 then return L('monday')
    when 2 then return L('tuesday')
    when 3 then return L('wednesday')
    when 4 then return L('thursday')
    when 5 then return L('friday')
    when 6 then return L('saturday')
    when 0 then return L('sunday')

root.getShortMonthString = (thisDate)->
  thisMonth = thisDate.getMonth()
  switch thisMonth
    when 0 then return L('jan').substr(0,3)
    when 1 then return L('feb').substr(0,3)
    when 2 then return L('mar').substr(0,3)
    when 3 then return L('apr').substr(0,3)
    when 4 then return L('may').substr(0,3)
    when 5 then return L('jun').substr(0,3)
    when 6 then return L('jul').substr(0,3)
    when 7 then return L('aug').substr(0,3)
    when 8 then return L('sep').substr(0,3)
    when 9 then return L('oct').substr(0,3)
    when 10 then return L('nov').substr(0,3)
    when 11 then return L('dec').substr(0,3)

root.getLocaleDateString = (thisDate)->
  thisMonth = thisDate.getMonth()
  switch thisMonth
    when 0 then return L('jan') + ' ' + thisDate.getDate() + ', ' + thisDate.getFullYear() 
    when 1 then return L('feb') + ' ' + thisDate.getDate() + ', ' + thisDate.getFullYear() 
    when 2 then return L('mar') + ' ' + thisDate.getDate() + ', ' + thisDate.getFullYear() 
    when 3 then return L('apr') + ' ' + thisDate.getDate() + ', ' + thisDate.getFullYear() 
    when 4 then return L('may') + ' ' + thisDate.getDate() + ', ' + thisDate.getFullYear() 
    when 5 then return L('jun') + ' ' + thisDate.getDate() + ', ' + thisDate.getFullYear() 
    when 6 then return L('jul') + ' ' + thisDate.getDate() + ', ' + thisDate.getFullYear() 
    when 7 then return L('aug') + ' ' + thisDate.getDate() + ', ' + thisDate.getFullYear() 
    when 8 then return L('sep') + ' ' + thisDate.getDate() + ', ' + thisDate.getFullYear() 
    when 9 then return L('oct') + ' ' + thisDate.getDate() + ', ' + thisDate.getFullYear() 
    when 10 then return L('nov') + ' ' + thisDate.getDate() + ', ' + thisDate.getFullYear() 
    when 11 then return L('dec')  + ' ' + thisDate.getDate() + ', ' + thisDate.getFullYear() 