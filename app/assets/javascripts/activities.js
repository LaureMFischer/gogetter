$(document).ready(function(){
  $.ajax({
    url: '/',
    type: 'GET',
    dataType: 'json'
  })
  .done(function(data) {
    Deck.storeData(data);
  });
  $('#next-activity').click(Deck.renderCard.bind(Deck));

});

var Deck = Deck || {
  current_card: 0,
  cards: []
};

Deck.storeData = function(data) {
  Deck.cards = data;
};

Deck.renderCard = function(e) {
  var $featureSpace = $('#activity-card'),
      cardHTML = Deck.renderCardHTML();

  console.log(this.current_card);
  if (Deck.current_card === Deck.cards.length - 1) {
    Deck.current_card = -1;
  };
  this.current_card++;
  $featureSpace.empty();
  $featureSpace.append(cardHTML);

  // add an event listener for the DoMe button
  $('#do-it-button').click(Deck.renderDoIt);
};

Deck.renderCardHTML = function() {
  var HTML = "<p class='activity-name'>" + Deck.cards[Deck.current_card].name + "</p>"
                  + "<p>" + Deck.cards[Deck.current_card].blurb + "</p>"
                  + "<p><a href="+ Deck.cards[Deck.current_card].url +">" + Deck.cards[Deck.current_card].url + "</a></p>"
                  + "<button id='do-it-button'>Do me!</button>";
  return HTML;
};

Deck.renderDoIt = function(event) {
  // emptying the div and redisplaying info is optional
  // but may be useful if we want to display different info here
  $('#activity-card').empty();
  $('#activity-card').append(Deck.doItHTML());
};

Deck.doItHTML = function() {
  var HTML;

  // this is kind of a hack to undo the incrementing counter at the end of Deck.renderCard()
  Deck.current_card = Deck.current_card - 1;

  HTML = "<p class='activity-name'>" + Deck.cards[Deck.current_card].name + "</p>"
                  + "<p>" + Deck.cards[Deck.current_card].blurb + "</p>"
                  + "<p> Things you'll need: " + Deck.cards[Deck.current_card].things_needed + "</p>"
                  + "<p><a href="+ Deck.cards[Deck.current_card].url +">" + Deck.cards[Deck.current_card].url + "</a></p>"
                  + "<button id='did-it-button'>I Did It!</button>";
  return HTML;
};

