import React from "react";
import { getRatingBg } from "../util/applicationUtils";

const ratings = [
  { key: "X", title: "Untested" },
  { key: "1", title: "Unusable" },
  { key: "2", title: "Acceptable" },
  { key: "3", title: "Good" },
  { key: "4", title: "Perfect" },
];

const Ratings = () => {
  return (
    <div>
      <div className="mt-5 grid grid-cols-1 gap-5 sm:grid-cols-2 lg:grid-cols-5">
        {ratings.map((rating) => (
          <div
            key={rating.key}
            className="bg-white overflow-hidden shadow rounded-lg"
          >
            <div className="px-3 py-5 sm:p-5">
              <div className="flex items-center">
                <div
                  className={`flex-shrink-0 rounded-md p-3 ${getRatingBg(
                    rating.key
                  )}`}
                >
                  <div className="flex font-bold justify-center items-center h-6 w-6 text-white">
                    <div>{rating.key}</div>
                  </div>
                </div>
                <div className="ml-3 w-0 flex-1">
                  <dl>
                    <dd className="flex items-baseline">
                      <div className="text-xl leading-8 font-semibold text-gray-900">
                        {rating.title}
                      </div>
                    </dd>
                  </dl>
                </div>
              </div>
            </div>
          </div>
        ))}
      </div>
    </div>
  );
};

export default Ratings;
