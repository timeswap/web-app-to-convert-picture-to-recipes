$(document).ready(function() {
  var foundInsightsToken = ''
  //Declare variables
  var $searchButton = $('#searchButton');
  //add a colon to the beginning of your AppId string
  var appId = ':fbe7a5147c4946a3a052a400859992a3';

  function getUrl(token_input) {
    var $searchQuery = $('#searchBox').val();
    var token_string = token_input

    var myUrl = "https://api.cognitive.microsoft.com/bing/v5.0/images/search" + "?q=" + $searchQuery + "&insightsToken=" + token_string + "&modulesRequested=Recipes";

    $.ajax({
      method: 'post',
      url: myUrl,
      headers: {
        'Ocp-Apim-Subscription-Key': 'fbe7a5147c4946a3a052a400859992a3'
      },
      success: function(data) {
        // for debugging & transversing the data objects
        window.imageData = data;
        console.log(window.imageData)

        // HOW TO GET RECIPE FROM PHOTO
        // https://api.cognitive.microsoft.com/bing/v5.0/images/search?q=pho&insightsToken=ccid_Lc5gHeyA*mid_C053606D818E66E38D42E655B016D4F3254F6303*simid_608041171484478328&modulesRequested=Recipes

        var urlLink = data.recipes[0].url;
        var recipe = document.createElement('a');
        recipe.setAttribute('href', urlLink);
        recipe.innerHTML = "LinkToRecipe";
        $('#output').append(recipe);
      },
      failure: function(err) {
        console.error(err);
      }
    });
  };

  //Function to get images
  function getImage() {
    //base64 encode the AppId
    // var azureKey = btoa(appId);

    //get the value from the search box
    var $searchQuery = $('#searchBox').val();

    //Create the search string
    var myUrl = "https://api.cognitive.microsoft.com/bing/v5.0/images/search" + "?q=" + $searchQuery ;

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
        console.log(window.imageData)

        // Appending first image result to front page
        var imgLink = data.value[0].thumbnailUrl;
        var image = $('<img></img>');
        image.attr('src', imgLink);
        $('#output').html(image);

        for (i=0; i<data.value.length; i++) {
          if (data.value[i].insightsSourcesSummary.recipeSourcesCount > 0 && data.value[i].imageInsightsToken) {
            foundInsightsToken = data.value[i].imageInsightsToken
            console.log(foundInsightsToken)
            getUrl(foundInsightsToken);
            break;
            // debugger;
            // getToken(foundInsightsToken);
            // return foundInsightsToken
          }

        };
      },
      failure: function(err) {
        console.error(err);
      }
    });
  };

  // Set a variable to be used to get recipe(s) from a photo
  function getToken(insightsToken) {

    // debugger;
    if (insightsToken) {
      var token_string = insightsToken;
      return token_string
    } else {
      return token_string
    }
  }



  //Trigger function when button is clicked
  $searchButton.click(function(e) {
    e.preventDefault();
    getImage();
  });
});

