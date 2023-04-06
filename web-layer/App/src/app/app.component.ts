import { Component, OnDestroy, OnInit } from '@angular/core';
import { Observable, interval, mergeMap } from 'rxjs';
import { HttpClient } from '@angular/common/http';
import { timer } from 'rxjs';


@Component({
	selector: 'app-root',
	templateUrl: './app.component.html',
	styleUrls: ['./app.component.scss']
})

export class AppComponent implements OnInit {
	public done: boolean = false;
	public graph: string = "\\wsl$\Ubuntu\home\carl3300\war-dot-io\resources\testImages";
	public image: string = "assets/flowdiagram.png";
	public outcome: string = "";
	private tempImg: string = ""
	private tempGraph: string = ""
	private timeStamp1: number = 0;
	private timeStamp2: number = 0;
	private url: string = "http://127.0.0.1:8000/";

	constructor(private http: HttpClient) { }

	ngOnInit(): void {
		this.reloadData().subscribe(x => this.outcome = x);
		interval(3 * 60 * 1000)
			.pipe(
				mergeMap(() => this.reloadData())
			)
			.subscribe(x => {
				this.outcome = x;
				this.timeStamp1 = 1
				this.timeStamp2 = 1
			})
	}
	public getImage() {
		if (this.timeStamp1) {
			this.tempImg = this.image + '?' + this.timeStamp1;
			this.timeStamp1 = 0;
			return this.tempImg;
		}
		return this.image;
	}

	public getGraph() {
		if (this.timeStamp2) {
			this.tempGraph = this.graph + '?' + this.timeStamp2;
			this.timeStamp2 = 0
			return this.tempGraph;
		}
		return this.graph;
	}

	private reloadData(): Observable<string> {
		return this.http.get<string>(this.url + "/reload")
	}
}
