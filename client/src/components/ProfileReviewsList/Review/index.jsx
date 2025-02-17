import React from "react";
import "./style.css";

const Review = (props) => {

  const createdAtDate = new Date(props.createdAt);

  const day = createdAtDate.getDate();
  const month = createdAtDate.getMonth() + 1;
  const year = createdAtDate.getFullYear();
  const hour = createdAtDate.getHours();
  const minute = createdAtDate.getMinutes();
  const second = createdAtDate.getSeconds();

  const formattedCreatedAt = `${day}/${month}/${year} at ${hour}:${minute}:${second}`;

  return (
    <div className="review-container">

       <img src={props.movieCover} alt="Movier poster"/>
        <div className="review-text">

            <div className="review-title">
                <h2>{props.title}</h2>
                {props.rating >= 1 && 
                  <>
                    <img src="../../assets/star-icon.svg" alt="Rating star icon"/>
                    <h3>{props.rating}/5</h3>
                  </>
                }
            </div>
            <p className="review-date">{props.createdAt}</p>
            <h2>{props.review}</h2>
        </div>
    </div>
  );
};

export default Review;
