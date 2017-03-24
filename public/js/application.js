$(document).ready(function() {
  //Declare variables
  var $searchButton = $('#searchButton');
  //add a colon to the beginning of your AppId string
  var appId = ':fbe7a5147c4946a3a052a400859992a3';

  //Function to get images
  function getImage() {
    //base64 encode the AppId
    var azureKey = btoa(appId);
    //get the value from the search box
    var $searchQuery = $('#searchBox').val();
    //Create the search string
    var myUrl = "https://api.cognitive.microsoft.com/bing/v5.0/images/search" + "?q=" + $searchQuery;
    //Make post request to bing
    $.ajax({
      method: 'post',
      url: myUrl,
      //Set headers to authorize search with Bing
      headers: {
        // 'Ocp-Apim-Subscription-Key': azureKey
        'Ocp-Apim-Subscription-Key': 'fbe7a5147c4946a3a052a400859992a3'
      },
      success: function(data) {
        // for debugging & transversing the data objects
        window.imageData = data;

        // HOW TO GET RECIPE FROM PHOTO
        https://api.cognitive.microsoft.com/bing/v5.0/images/search?q=pho&insightsToken=ccid_Lc5gHeyA*mid_C053606D818E66E38D42E655B016D4F3254F6303*simid_608041171484478328&modulesRequested=Recipes

        var imgLink = data.value[0].thumbnailUrl;
        var image = $('<img></img>');
        image.attr('src', imgLink);
        $('#output').html(image);
      },
      failure: function(err) {
        console.error(err);
      }
    });
  };
  //Trigger function when button is clicked
  $searchButton.click(function(e) {
    e.preventDefault();
    getImage();
  });
});

