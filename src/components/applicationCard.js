import React from "react";
import { Link } from "gatsby";
import { getRatingBg } from "../util/applicationUtils";

const ApplicationCard = ({ app }) => {
  const APPLICATIONS_DIR = "applications/";
  const getUrl = (slug) => APPLICATIONS_DIR + slug;

  return (
    <>
      <div
        className={`flex-shrink-0 flex items-center justify-center w-16 text-white text-sm leading-5 font-medium rounded-l-md ${getRatingBg(
          app.Rating__1_4_
        )}`}
      >
        {app.Rating__1_4_}
      </div>
      <div className="flex-1 flex items-center justify-between border-t border-r border-b border-gray-200 bg-white truncate">
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
      <div
        className={`flex-shrink-0 flex items-center justify-center w-16 text-white text-sm leading-5 font-medium rounded-r-md ${getRatingBg(
          app.MicroG_Rating__1_4_
        )}`}
      >
        &mu;{app.MicroG_Rating__1_4_}
      </div>
    </>
  );
};

export default ApplicationCard;
