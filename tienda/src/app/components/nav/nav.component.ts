import { Component } from '@angular/core';
import { Router } from '@angular/router';
import { GLOBAL } from 'src/app/services/GLOBAL';
import { ClienteService } from 'src/app/services/cliente.service';
declare var $:any;


@Component({
  selector: 'app-nav',
  templateUrl: './nav.component.html',
  styleUrls: ['./nav.component.css']
})
export class NavComponent {
  public token;
  public id:any;
  public user : any = undefined;
  public user_lc : any = undefined;  
<<<<<<< HEAD
  public config_global : any = {};
  public op_cart = false;

  public carrito_arr : Array<any> = [];
  public url:any;
=======

>>>>>>> master

  constructor(
    private _clienteService: ClienteService,
    private _router:Router

  ) { 
<<<<<<< HEAD
    this._clienteService.obtener_config_publico().subscribe(
      response=>{
        this.config_global = response.data;
        console.log(this.config_global);
        
      }
    )
    this.url = GLOBAL.url;
=======
>>>>>>> master
    this.token = localStorage.getItem('token');
    this.id = localStorage.getItem('_id'); 

    if(this.token){
      this._clienteService.obtener_cliente_guest(this.id,this.token).subscribe(
        response=>{
          
          this.user = response.data;
          localStorage.setItem('user_data',JSON.stringify(this.user));
          if(localStorage.getItem('user_data')){
            this.user_lc = JSON.parse(localStorage.getItem('user_data')!); 
          }else{
            this.user_lc = undefined;
          }
        },
          (error:any)=>{
  
            this.user = undefined;
          }
        );
    }





    
    }

    logout(){
      window.location.reload();
      localStorage.clear();
      this._router.navigate(['/']);
    }

    op_modalcart(){
      if(!this.op_cart){
        this.op_cart = true;
        $('#cart').addClass('show');
      }else{
        this.op_cart = false;
        $('#cart').removeClass('show');
      }
    }

    
       
}

