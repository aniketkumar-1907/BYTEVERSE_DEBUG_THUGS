import React, {Component} from 'react';
// import Nav from "../components/Nav";
// import Header from "../components/Header";
 import election from '../ethereum/electionFactory';
 import { Card, Button } from "semantic-ui-react";
// import App from './_app'

class ElectionIndex extends Component{
    // static async getInitialProps() {
       
    //     const campaigns = await election.methods.getDeployedElection("abcd").call();
    //     console.log(campaigns);
    //     return {campaigns};
    //   }

      render() {
        return (
            <div>Hello</div>
        );
      }
}

export default ElectionIndex;