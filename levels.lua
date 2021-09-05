local levels = {
 -- first
{
  IsCompleted = false,
  Complexity = "easy",
  aimachines = {
   state = true,
   name = "executive",
   x = 500,
   y = 300,
   gatebt = "and"
  } ,
  gates = {
   x = 300,
   y = 300,
  } ,
  signator = {
   {
   x = 100,
   y = 200,
   state = true,
   },
   {
   x = 100,
   y = 400,
   state = true,
   }
  },
 },
 -- second
 {
  IsCompleted = false,
  Complexity = "easy",
  aimachines = {
   state = true,
   name = "executive",
   x = 500,
   y = 300,
   gatebt = "or"
  } ,
  gates = {
   x = 300,
   y = 300,
  } ,
  signator = {
   {
   x = 100,
   y = 200,
   state = true,
   },
   {
   x = 100,
   y = 400,
   state = true,
   }
  },
 },
 -- third
 {
  IsCompleted = false,
  Complexity = "easy",
  aimachines = {
   state = true,
   name = "executive",
   x = 500,
   y = 300,
   gatebt = "or"
  } ,
  gates = {
   x = 300,
   y = 300,
  } ,
  signator = {
   {
   x = 100,
   y = 200,
   state = true,
   },
   {
   x = 100,
   y = 300,
   state = true,
   },
   {
   x = 100,
   y = 400,
   state = true,
   }
  },
 },
 -- fourth
 {
  IsCompleted = false,
  Complexity = "easy",
  aimachines = {
   state = true,
   name = "executive",
   x = 500,
   y = 300,
   gatebt = "or"
  } ,
  gates = {
   x = 300,
   y = 300,
  } ,
  signator = {
   {
   x = 100,
   y = 200,
   state = true,
   },
   {
   x = 100,
   y = 300,
   state = true,
   },
   {
   x = 100,
   y = 400,
   state = true,
   },
   {
   x = 100,
   y = 500,
   state = true,
   }
  },
 },
 -- fifth
{
  IsCompleted = false,
  Complexity = "complex",
  aimachines = {
   state = true,
   name = "executive",
   x = 500,
   y = 300,
  } ,
  connectingGate ={
    name = "and",
    x = 300,
    y = 300,
  },
  gates = {
   {
    name = "and",
    x = 200,
    y = 250,
  },
  {
    name = "or",
    x = 400,
    y = 450,
  }
  } ,
  signator = {
   {
   x = 100,
   y = 200,
   state = false,
   gatebt = "and"
   },
   {
   x = 100,
   y = 300,
   state = true,
   gatebt = "and"
   },
   {
   x = 100,
   y = 400,
   state = false,
   gatebt = "or"
   },
   {
   x = 100,
   y = 500,
   state = true,
   gatebt = "or"
   }
  },
 },
 -- Sixth
{
  IsCompleted = false,
  Complexity = "complex",
  aimachines = {
   state = true,
   name = "admiral",
   x = 500,
   y = 300,
  } ,
  connectingGate ={
    name = "or",
    x = 300,
    y = 300,
  },
  gates = {
   {
    name = "and",
    x = 200,
    y = 250,
  },
  {
    name = "or",
    x = 400,
    y = 450,
  }
  } ,
  signator = {
   {
   x = 100,
   y = 200,
   state = false,
   gatebt = "and"
   },
   {
   x = 100,
   y = 300,
   state = true,
   gatebt = "and"
   },
   {
   x = 100,
   y = 400,
   state = false,
   gatebt = "or"
   },
   {
   x = 100,
   y = 500,
   state = true,
   gatebt = "or"
   }
  },
 },
 -- Seventh
{
  IsCompleted = false,
  Complexity = "complex",
  aimachines = {
   state = true,
   name = "admiral",
   x = 500,
   y = 300,
  } ,
  connectingGate ={
    name = "or",
    x = 300,
    y = 300,
  },
  gates = {
   {
    name = "or",
    x = 200,
    y = 250,
  },
  {
    name = "and",
    x = 400,
    y = 450,
  }
  } ,
  signator = {
   {
   x = 100,
   y = 200,
   state = true,
   gatebt = "and"
   },
   {
   x = 100,
   y = 300,
   state = true,
   gatebt = "and"
   },
   {
   x = 100,
   y = 400,
   state = true,
   gatebt = "or"
   },
   {
   x = 100,
   y = 500,
   state = true,
   gatebt = "or"
   }
  },
 },
 -- Eighth
{
  IsCompleted = false,
  Complexity = "complex",
  aimachines = {
   state = true,
   name = "executive",
   x = 500,
   y = 300,
  } ,
  connectingGate ={
    name = "and",
    x = 300,
    y = 300,
  },
  gates = {
   {
    name = "or",
    x = 200,
    y = 250,
  },
  {
    name = "and",
    x = 400,
    y = 450,
  }
  } ,
  signator = {
   {
   x = 100,
   y = 200,
   state = true,
   gatebt = "and"
   },
   {
   x = 100,
   y = 300,
   state = true,
   gatebt = "and"
   },
   {
   x = 100,
   y = 400,
   state = true,
   gatebt = "or"
   },
   {
   x = 100,
   y = 500,
   state = true,
   gatebt = "or"
   }
  },
 },
 -- Ninth
{
  IsCompleted = false,
  Complexity = "complex",
  aimachines = {
   state = true,
   name = "admiral",
   x = 500,
   y = 300,
  } ,
  connectingGate ={
    name = "or",
    x = 300,
    y = 300,
  },
  gates = {
   {
    name = "and",
    x = 200,
    y = 250,
  },
  {
    name = "or",
    x = 400,
    y = 450,
  }
  } ,
  signator = {
   {
   x = 100,
   y = 200,
   state = false,
   gatebt = "or"
   },
   {
   x = 100,
   y = 300,
   state = true,
   gatebt = "or"
   },
   {
   x = 100,
   y = 400,
   state = false,
   gatebt = "and"
   },
   {
   x = 100,
   y = 500,
   state = true,
   gatebt = "and"
   }
  },
 },
 }

 return levels
