re.c('wait')
.defines({
  
  wait:function(method, time){
    time = time || 1000;
    
    //convert seconds to milliseconds
    if(time < 100) time *= 1000;
    
    if(this.timeout)
      clearTimeout(this.timeout);
    this.timeout = setTimeout(method, time);
    return this;
  }
  
})
.dispose(function() {
  if(this.timeout)
    clearTimeout(this.timeout);
});