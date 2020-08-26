import React from "react";
import { Link } from "gatsby";

const ApplicationCard = ({ app }) => {
  let ratingClass = "bg-gray-600";

  switch (app.Rating__1_4_) {
    case "1":
      ratingClass = "bg-red-600";
      break;
    case "2":
      ratingClass = "bg-orange-600";
      // code block
      break;
    case "3":
      ratingClass = "bg-blue-600";
      // code block
      break;
    case "4":
      ratingClass = "bg-green-600";
      // code block
      break;
    default:
      ratingClass = "bg-gray-600";
  }

  const applicationsDir = "applications/";
  const getUrl = (slug) => applicationsDir + slug;

  return (
    <>
      <div
        className={`flex-shrink-0 flex items-center justify-center w-16 text-white text-sm leading-5 font-medium rounded-l-md ${ratingClass}`}
      >
        {app.Rating__1_4_}
      </div>
      <div className="flex-1 flex items-center justify-between border-t border-r border-b border-gray-200 bg-white rounded-r-md truncate">
        <div className="flex-1 px-4 py-2 text-sm leading-5 truncate">
          <Link
            className="truncate text-gray-900 font-medium hover:text-gray-600 transition ease-in-out duration-150"
            to={getUrl(app.fields.slug)}
          >
            {app.Application}
          </Link>
          <p className="text-gray-500">
            {app.Year} {app.Month}
          </p>
        </div>
      </div>
    </>
  );
};

export default ApplicationCard;
