import { Component } from '@angular/core';

@Component({
	selector: 'app-root',
	templateUrl: './app.component.html',
	styleUrls: ['./app.component.scss']
})

export class AppComponent {
	public image: string = "";
	public graph: string = "";
	private url: string = "http://127.0.0.1:8000/";

	constructor() { }

	public getImage(): string {
		return "";
	}

	public getGraph(): string {
		return "  "
	}
}
