module need
  use iso_c_binding
  
contains
  function rho(h) bind(c)
    
    real(c_float)::rho
    real(c_float),value::h
    rho=1.225*exp(-h/8500.0)
  end function

  function fdrag(h,v,Cd,A) bind(c)
    
    real(c_float)::fdrag
    real(c_float),value::h,v,Cd,A
    fdrag=0.5*rho(h)*(v**2)*Cd*A
  end function
  function compute(h, v, dt, mass, Cd, A) bind(c)
    real(c_float) ::compute
    real(c_float),value::dt, Cd, A,mass
    real(c_float)::v,h
    integer(c_int)::step=0
    real(c_float)::t=0.0
    real(c_float)::acc
    print *,"Computing..."
    do while (h > 0.0)
      acc = (mass * 9.81 - fdrag(h, v, Cd, A)) / mass
      v   = v + acc * dt   
      h   = h - v * dt      
      t   = t + dt
      step = step + 1
    end do
    compute=v
  end function
end module need




