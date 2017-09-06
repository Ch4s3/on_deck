import { h, Component } from 'preact';
import { createApolloFetch } from 'apollo-fetch';
import BeerList from '../../components/beer_list';
import style from './style';

export default class Brewer extends Component {
	state = {
		time: Date.now(),
		userName: "",
		beerCount: 0,
		beers: [],
	};

	// update the current time
	updateTime = () => {
		this.setState({ time: Date.now() });
	};

	parseData = (data) => {
		const user = data.user
		this.setState({
			userName: user.name,
			beerCount: user.beers.length,
			beers: user.beers
		});
	}
	
	// gets called when this route is navigated to
	componentDidMount() {
		const uri = 'http://localhost:4000/graph';
		const apolloFetch = createApolloFetch({ uri });

		const query = `
			query userBeers($id: ID!, $onTap: Boolean) {
				user(id: $id){
					name
					id
					uuid
					beers(onTap: $onTap){
						id
						name
						style
						description
						ingredients
						abv
						measuredOriginalGravity
						measuredFinalGravity
						boilTime
						estimatedIbu
						volumeInLiters
						brewDate
						bottleOrKegDate
						rating
						onTap
					}
				}
			}
		`;
		
		const variables = {
			id: this.props.user,
			onTap: true,
		};

		apolloFetch({ query, variables })
			.then(result => {
				const { data, errors, extensions } = result;
				this.parseData(data);
			})
			.catch(error => {
				console.log(error)
				//respond to a network error
		});
		// start a timer for the clock:
		this.timer = setInterval(this.updateTime, 1000);
	}

	// gets called just before navigating away from the route
	componentWillUnmount() {
		clearInterval(this.timer);
	}

	// Note: `user` comes from the URL, courtesy of our router
	render({ user }, { time, userName, beerCount, beers }) {
		return (
			<div class={style.brewer}>
				<h1>Brewer: {userName}</h1>
				<p>This is the brewer profile for a user named {userName}.</p>

				<div>Current time: {new Date(time).toLocaleString()}</div>
				<div>beers on tap: {beerCount}</div>
				<BeerList beers={beers}/>
			</div>
		);
	}
}
