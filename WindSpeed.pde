


int windSpeed;
String lastbuilddate;

String testurl = ("https://query.yahooapis.com/v1/public/yql?q=select%20*%20from%20weather.forecast%20where%20woeid%20in%20(select%20woeid%20from%20geo.places(1)%20where%20text%3D%22Albuquerque%2C%20NM%22)&diagnostics=true&env=store%3A%2F%2Fdatatables.org%2Falltableswithkeys");
String url = ("https:"+"//query.yahooapis.com/v1/public/yql?q=select%20*%20from%20weather.forecast%20where%20woeid%20in%20(select%20woeid%20from%20geo.places(1)%20where%20text%3D%22albuquerque%2C%20nm%22)&format=xml&env=store%3A%2F%2Fdatatables.org%2Falltableswithkeys");
void setup()
{
  size(350, 350);
  draw();
  
 
}
/*
void getWeather()
{
   XML xml = loadXML("https:"+"//query.yahooapis.com/v1/public/yql?q=select%20*%20from%20weather.forecast%20where%20woeid%20in%20(select%20woeid%20from%20geo.places(1)%20where%20text%3D%22abq%2C%20nm%22)&format=xml&env=store%3A%2F%2Fdatatables.org%2Falltableswithkeys");
 
  XML yweather = xml.getChild("results/channel/yweather:wind");
  windSpeed = yweather.getInt("speed");
  
}
*/
void draw(){
  if(!loadXML(url).getChild("results/channel/lastBuildDate").getContent().equals(lastbuilddate)){
    update();
  }
  
}
void update() {
  // Set up the speed range
  int minSpeed= 10;
  int maxSpeed = 95;

 // Convert wind speed to a 0-255 color value
  float windColor = map(windSpeed, minSpeed, maxSpeed, 0, 255);    
  
   XML xml = loadXML(url);
   
   lastbuilddate=xml.getChild("results/channel/lastBuildDate").getContent();
   
 
   XML yweather = xml.getChild("results/channel/yweather:wind");
   
   
   
   windSpeed = yweather.getInt("speed");

  // Set background color using wind speed on a blue to red scale     
  background(color(windColor, 0, 255-windColor));
  
   
   // Print the results
  println(" the current wind speed in ABQ is " + windSpeed);
  //delay(10000); 
}