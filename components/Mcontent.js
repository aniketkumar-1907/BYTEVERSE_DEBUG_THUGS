import React from 'react'
import Content from './Content';
import items from "./data";
const Mcontent = () => {
  return (
    <div>
        {Array.from(items).map(function elements(val){
            return(
                <Content
                image={val.image}
                title={val.title}
                />

                
            )
        })}
    </div>
  )
}

export default Mcontent