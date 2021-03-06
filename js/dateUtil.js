(function() {

  root.getDayOfWeekString = function(thisDate) {
    var thisDay;
    thisDay = thisDate.getDay();
    switch (thisDay) {
      case 1:
        return L('monday');
      case 2:
        return L('tuesday');
      case 3:
        return L('wednesday');
      case 4:
        return L('thursday');
      case 5:
        return L('friday');
      case 6:
        return L('saturday');
      case 0:
        return L('sunday');
    }
  };

  root.getShortMonthString = function(thisDate) {
    var thisMonth;
    thisMonth = thisDate.getMonth();
    switch (thisMonth) {
      case 0:
        return L('jan').substr(0, 3);
      case 1:
        return L('feb').substr(0, 3);
      case 2:
        return L('mar').substr(0, 3);
      case 3:
        return L('apr').substr(0, 3);
      case 4:
        return L('may').substr(0, 3);
      case 5:
        return L('jun').substr(0, 3);
      case 6:
        return L('jul').substr(0, 3);
      case 7:
        return L('aug').substr(0, 3);
      case 8:
        return L('sep').substr(0, 3);
      case 9:
        return L('oct').substr(0, 3);
      case 10:
        return L('nov').substr(0, 3);
      case 11:
        return L('dec').substr(0, 3);
    }
  };

  root.getLocaleDateString = function(thisDate) {
    var thisMonth;
    thisMonth = thisDate.getMonth();
    switch (thisMonth) {
      case 0:
        return L('jan') + ' ' + thisDate.getDate() + ', ' + thisDate.getFullYear();
      case 1:
        return L('feb') + ' ' + thisDate.getDate() + ', ' + thisDate.getFullYear();
      case 2:
        return L('mar') + ' ' + thisDate.getDate() + ', ' + thisDate.getFullYear();
      case 3:
        return L('apr') + ' ' + thisDate.getDate() + ', ' + thisDate.getFullYear();
      case 4:
        return L('may') + ' ' + thisDate.getDate() + ', ' + thisDate.getFullYear();
      case 5:
        return L('jun') + ' ' + thisDate.getDate() + ', ' + thisDate.getFullYear();
      case 6:
        return L('jul') + ' ' + thisDate.getDate() + ', ' + thisDate.getFullYear();
      case 7:
        return L('aug') + ' ' + thisDate.getDate() + ', ' + thisDate.getFullYear();
      case 8:
        return L('sep') + ' ' + thisDate.getDate() + ', ' + thisDate.getFullYear();
      case 9:
        return L('oct') + ' ' + thisDate.getDate() + ', ' + thisDate.getFullYear();
      case 10:
        return L('nov') + ' ' + thisDate.getDate() + ', ' + thisDate.getFullYear();
      case 11:
        return L('dec') + ' ' + thisDate.getDate() + ', ' + thisDate.getFullYear();
    }
  };

}).call(this);
