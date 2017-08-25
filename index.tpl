<html>
<head>
    <title>Answery- a simple webapp for people who like answering questions</title>
    <link rel="stylesheet" href="style.css" type="text/css">
    <meta charset="UTF-8">
    <meta property="og:site_name" content="Answery" />
    <meta property="og:image" content="https://answery.herokuapp.com/answery-logo.jpg" />
    <meta name="description" content="A simple webapp for people who like answering random questions">
    <meta name="keywords" content="Answery, cats, cute, boredom, questions">
    <meta name="author" content="Adrian Edwards">

</head>
<body>
    <h1>Answery</h1>
    <p id="subtitle">-a simple webapp for people who like answering random questions-</p>
    <ul class="menu">
     <li class="link"><a class="menu" href="http://github.com/DeveloperACE/Answery">Source Code</a></li> -
     <li class="link"><a class="menu" href="https://github.com/DeveloperACE/Answery/issues/new">Submit Questions/Feedback</a></li>
 </ul>
     <br>
     <div class="socialMediaButtons">
     {nocache}
     {if isset($catpath)}

         <a class="twitter-share-button"
      href="https://twitter.com/intent/tweet?text=Answer%20questions%3A%20get%20cats!">
     Tweet</a>
    {else}
    <a class="twitter-share-button"
 href="https://twitter.com/intent/tweet?text={$socialMediaText}">
Tweet</a>
    {/if}
    {/nocache}

     <g:plusone></g:plusone>
 </div>

    <hr>
{nocache}
    {if isset($catpath)}
    <h2>Here's your reward cat!</h2>
        <img id="rewardcat" src="{$catpath}" />

    {else}
    <h2>{$questionText}</h2>

        {if $questiontype eq "shortanswer"}
            <textarea form="continue" required></textarea>

        {elseif $questiontype eq "multiplechoice" and $datasource eq "randomFromAPI"}
            <form class="multiplechoiceIMG">
            {foreach from=$choices key=$key item=$value}
                <label class="multiplechoiceIMG"><input type="radio" form="continue" name="multiplechoice" required><img class="multiplechoiceimage" src="{$value}"></label><br>
            {/foreach}
            </form>

        {elseif $questiontype eq "multiplechoice"}
            <form class="multiplechoice">
                {foreach from=$choices key=$key item=$value}
                    <label class="multiplechoice"><input type="radio" form="continue" name="multiplechoice" required>{$value}</label><br>
                {/foreach}
            </form>

        {elseif $questiontype eq "rating"}
        <small>Click the red circles to rate</small>
        {if $datasource eq "randomFromAPI"}
        <img class="rating" src="{$ratingPhoto}" />
        {/if}
        <form class="rating">
            <span class="starRating">
                {for $point=1 to 10}
                <input form="continue" id="rating{$point}" type="radio" name="rating" value="{$point}" required>
                <label for="rating{$point}">{$point}</label>
                {/for}
            </span>
        </form>
        {/if}
    {/if}
<footer>
    <form id="continue" action="#" method="post">
        {if $cat eq 0}
        <input type="hidden" name="cat" value="1"></input>
        {elseif cat eq 1}
        <input type="hidden" name="cat" value="0"></input>
        {/if}
        <input type="submit" value="Continue >"></input>
    </form>
    {if $cat eq 0}
    <form id="skip" action="/">
        <input type="submit" value="Skip >"></input>
    </form>
    {/if}
</footer>
{/nocache}

{literal}
<script>
  (function(i,s,o,g,r,a,m){i['GoogleAnalyticsObject']=r;i[r]=i[r]||function(){
  (i[r].q=i[r].q||[]).push(arguments)},i[r].l=1*new Date();a=s.createElement(o),
  m=s.getElementsByTagName(o)[0];a.async=1;a.src=g;m.parentNode.insertBefore(a,m)
  })(window,document,'script','https://www.google-analytics.com/analytics.js','ga');

  ga('create', 'UA-64146907-4', 'auto');
  ga('send', 'pageview');

</script>


<script>window.twttr = (function(d, s, id) {
  var js, fjs = d.getElementsByTagName(s)[0],
    t = window.twttr || {};
  if (d.getElementById(id)) return t;
  js = d.createElement(s);
  js.id = id;
  js.src = "https://platform.twitter.com/widgets.js";
  fjs.parentNode.insertBefore(js, fjs);

  t._e = [];
  t.ready = function(f) {
    t._e.push(f);
  };

  return t;
}(document, "script", "twitter-wjs"));</script>
<script src="https://apis.google.com/js/platform.js" async defer></script>


{/literal}
</body>
</html>
