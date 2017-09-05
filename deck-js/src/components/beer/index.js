import { h, Component } from 'preact';


export default class Beer extends Component {
  render() {
    const beer = this.props.beer;
    const liStyle = { padding: '0.25em' };
    const ulStyle = { listStyle: 'none' };
    const beerStyle = {
      padding: '1em',
      margin: '1em',
      background: 'rgba(250,250,250,0.5)',
      boxShadow: '0 1px 5px rgba(0,0,0,0.5)',
    };
    return (
      <div style={beerStyle}>
        <h3>{beer.name}</h3>
        <ul style={ulStyle}>
          <li style={liStyle}> Style: {beer.style} </li>
          <li style={liStyle}> Abv: {beer.abv} </li>
          <li style={liStyle}> Style: {beer.style} </li>
        </ul>
      </div>
    );
  }
}
