import React from 'react'
import img1 from './images/image1.jpg'
import background from './images/backimg.jpeg';
import styles from '../styles/Home.module.css';

const Header = () => {
  return (
    <div className={styles.head} >
        <header>
        <div className={styles.voteimage}>
        <img src={img1} alt="voting image" width="150px" />
        </div>
        <div className={styles.tag} >
        <p className={styles.heading}>Your Vote Matters!</p>
        </div>
        </header>
    </div>
  )
}

export default Header