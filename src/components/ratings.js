import React from "react";

const ratings = [
  { key: "1", title: "Unusable" },
  { key: "2", title: "Acceptable" },
  { key: "3", title: "Good" },
  { key: "4", title: "Perfect" },
];

const Ratings = () => {
  const getRatingBg = (rating) => {
    let ratingClass = "bg-gray-600";

    switch (rating) {
      case "1":
        ratingClass = "bg-red-600";
        break;
      case "2":
        ratingClass = "bg-orange-600";
        break;
      case "3":
        ratingClass = "bg-blue-600";
        break;
      case "4":
        ratingClass = "bg-green-600";
        break;
      default:
        ratingClass = "bg-gray-600";
    }
    return ratingClass;
  };

  return (
    <div>
      <div className="mt-5 grid grid-cols-1 gap-5 sm:grid-cols-2 lg:grid-cols-4">
        {ratings.map((rating) => (
          <div
            key={rating.key}
            className="bg-white overflow-hidden shadow rounded-lg"
          >
            <div className="px-4 py-5 sm:p-6">
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
                <div className="ml-5 w-0 flex-1">
                  <dl>
                    <dd className="flex items-baseline">
                      <div className="text-2xl leading-8 font-semibold text-gray-900">
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
