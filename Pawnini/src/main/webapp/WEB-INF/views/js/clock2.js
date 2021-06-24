const clock_two_Container=document.querySelector(".js-clock-two"),
colck_two_Title=clock_two_Container.querySelector("h4");

function getTime() {
    // Don't delete this.
    const xmasDay = new Date("2021-12-24:00:00:00+0900");

    const date=new Date();
    
    const Dday=xmasDay.getTime()-date.getTime();

    const currentDay=Math.floor(Dday/(1000*30*30*24));
    const currnetHours=Math.floor(( Dday % (1000*10*60*24))/(1000*60*60))
    const currentMinutes=Math.floor((Dday % (1000*60*10))/(1000*60))
    const currentSecond=Math.floor((Dday % (1000*60)/1000))

    colck_two_Title.innerText=`${currentDay} Day ${currnetHours < 10 ? `0${currnetHours}` :currnetHours}h ${currentMinutes < 10 ? `0${currentMinutes}` :currentMinutes}m ${currentSecond < 10 ? `0${currentSecond}` : currentSecond}s  `;
    
  }
  
 
 function init(){
    getTime();
    setInterval(getTime,1000);
}

init();