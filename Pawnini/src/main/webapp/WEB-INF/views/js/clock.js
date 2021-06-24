const clockContainer=document.querySelector(".js-clock"),
colckTitle=clockContainer.querySelector("h3");

function getTime() {
    // Don't delete this.
    const xmasDay = new Date("2021-12-24:00:00:00+0900");

    const date=new Date();
    
    const Dday=xmasDay.getTime()-date.getTime();

    const currentDay=Math.floor(Dday/(1000*60*60*24));
    const currnetHours=Math.floor(( Dday % (1000*60*60*24))/(1000*60*60))
    const currentMinutes=Math.floor((Dday % (1000*60*60))/(1000*60))
    const currentSecond=Math.floor((Dday % (1000*60)/1000))

    colckTitle.innerText=`${currentDay} Day ${currnetHours < 10 ? `0${currnetHours}` :currnetHours}h ${currentMinutes < 10 ? `0${currentMinutes}` :currentMinutes}m ${currentSecond < 10 ? `0${currentSecond}` : currentSecond}s  `;
    
  }
  
 
 function init(){
    getTime();
    setInterval(getTime,1000);
}

init();