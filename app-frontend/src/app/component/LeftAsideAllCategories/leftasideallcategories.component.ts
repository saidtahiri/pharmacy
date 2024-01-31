import { CommonModule } from '@angular/common';
import { Component } from '@angular/core';
import { RouterLink, RouterLinkActive } from '@angular/router';

@Component({
  selector: 'leftasideallcategories',
  standalone: true,
  imports: [RouterLink,RouterLinkActive,CommonModule],
  templateUrl: './leftasideallcategories.component.html',
  styleUrl: './leftasideallcategories.component.scss'
})
export class LeftasideallcategoriesComponent {


  hideContent:boolean=false;
  hideOrShow(){
    if(this.hideContent==true){
      this.hideContent=false
    }else{
      this.hideContent=true
    }
  }
}
