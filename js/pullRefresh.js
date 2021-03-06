(function() {
  var actInd, arrow, beginReloading, border, endReloading, formatDate, lastUpdatedLabel, pulling, reloading, statusLabel, tableHeader;

  formatDate = function() {
    var datestr, timestr;
    datestr = String.formatDate(new Date());
    timestr = String.formatTime(new Date());
    return datestr + ' ' + timestr;
  };

  border = Ti.UI.createView({
    backgroundColor: "#576c89",
    height: 2,
    bottom: 0
  });

  tableHeader = Ti.UI.createView({
    backgroundColor: "#e2e7ed",
    width: '100%',
    height: 60
  });

  tableHeader.add(border);

  arrow = Ti.UI.createView({
    backgroundImage: "/images/whiteArrow.png",
    width: 23,
    height: 60,
    bottom: 10,
    left: 20
  });

  statusLabel = Ti.UI.createLabel({
    text: "Pull to reload",
    left: 55,
    width: 200,
    bottom: 30,
    height: "auto",
    color: "#576c89",
    textAlign: "center",
    font: {
      fontSize: 13,
      fontWeight: "bold"
    },
    shadowColor: "#999",
    shadowOffset: {
      x: 0,
      y: 1
    }
  });

  lastUpdatedLabel = Ti.UI.createLabel({
    text: "Last Updated: " + formatDate(),
    left: 55,
    width: 200,
    bottom: 15,
    height: "auto",
    color: "#576c89",
    textAlign: "center",
    font: {
      fontSize: 12
    },
    shadowColor: "#999",
    shadowOffset: {
      x: 0,
      y: 1
    }
  });

  actInd = Titanium.UI.createActivityIndicator({
    left: 20,
    bottom: 13,
    width: 30,
    height: 30
  });

  tableHeader.add(arrow);

  tableHeader.add(statusLabel);

  tableHeader.add(lastUpdatedLabel);

  tableHeader.add(actInd);

  root.dealsTable.headerPullView = tableHeader;

  pulling = false;

  reloading = false;

  beginReloading = function() {
    root.reloadDeals = true;
    root.loadDeals(root.city);
    return setTimeout(endReloading, 3000);
  };

  endReloading = function() {
    reloading = false;
    lastUpdatedLabel.text = L('lastUpdated') + ': ' + formatDate();
    statusLabel.text = L('pullRefresh') + '...';
    actInd.hide();
    return arrow.show();
  };

  root.dealsTable.addEventListener('scroll', function(e) {
    var offset, t;
    offset = e.contentOffset.y;
    if (offset <= -65.0 && !pulling) {
      t = Ti.UI.create2DMatrix();
      t = t.rotate(-180);
      pulling = true;
      arrow.animate({
        transform: t,
        duration: 180
      });
      statusLabel.text = L('releaseRefresh') + '...';
    } else if (pulling && offset > -65.0 && offset < 0) {
      pulling = false;
      t = Ti.UI.create2DMatrix();
      arrow.animate({
        transform: t,
        duration: 180
      });
      statusLabel.text = L('pullRefresh') + '...';
    }
    return 1;
  });

  root.dealsTable.addEventListener('scrollEnd', function(e) {
    if (pulling && !reloading && e.contentOffset.y <= -65.0) {
      reloading = true;
      pulling = false;
      arrow.hide();
      actInd.show();
      statusLabel.text = L('reloading') + '...';
      arrow.transform = Ti.UI.create2DMatrix();
      beginReloading();
    }
    return 1;
  });

}).call(this);
