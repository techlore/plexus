import React from "react";

const ApplicationCardInfo = () => {
  const infos = [
    { key: 1, description: "Rating" },
    { key: 2, description: "MicroG Rating" },
    { key: 3, description: "Application Name" },
    { key: 4, description: "Date last rated on" },
  ];

  const buildDate = new Date();
  const displayedDate =
    buildDate.getFullYear() +
    " " +
    buildDate.toLocaleString("default", { month: "long" });

  return (
    <div className="my-20 flex flex-col items-start">
      <h3 className="mb-6 text-3xl font-bold">Application Card breakdown.</h3>
      <div className="mb-6 self-center flex min-w-full md:min-w-0">
        <div className="flex-shrink-0 flex items-center justify-center w-16 text-white text-sm leading-5 font-medium rounded-l-md bg-indigo-600">
          <div class="flex justify-center items-center p-1 h-8 w-8 bg-white text-xs leading-4 font-medium rounded-full">
            <div className="font-bold text-indigo-600">1</div>
          </div>
        </div>
        <div className="flex-1 flex items-center justify-between border-t border-r border-b border-gray-200 bg-white truncate">
          <div className="flex-1 px-4 py-2 text-sm leading-5 truncate">
            <div className="mb-2 flex items-center truncate text-gray-900 font-medium transition ease-in-out duration-150">
              <div class="flex justify-center items-center p-1 h-8 w-8 bg-indigo-600 text-xs leading-4 font-medium rounded-full">
                <div className="font-bold text-white">3</div>
              </div>
              <div className="ml-2">Youtube</div>
            </div>
            <div className="flex items-center truncate text-gray-900 font-medium transition ease-in-out duration-150">
              <div class="flex justify-center items-center p-1 h-8 w-8 bg-indigo-600 text-xs leading-4 font-medium rounded-full">
                <div className="font-bold text-white">4</div>
              </div>
              <div className="ml-2">{displayedDate}</div>
            </div>
          </div>
        </div>
        <div className="flex-shrink-0 flex items-center justify-center w-16 text-white text-sm leading-5 font-medium rounded-r-md bg-indigo-600">
          <div class="flex justify-center items-center p-1 h-8 w-8 bg-white text-xs leading-4 font-medium rounded-full">
            <div className="font-bold text-indigo-600">2</div>
          </div>
        </div>
      </div>
      <div className="mb-6">
        {infos.map(({ key, description }) => (
          <div key={key}>
            <div className="mb-2 flex items-center truncate text-gray-900 font-medium transition ease-in-out duration-150">
              <div class="flex justify-center items-center p-1 h-8 w-8 bg-indigo-600 text-xs leading-4 font-medium rounded-full">
                <div className="font-bold text-white">{key}</div>
              </div>
              <div className="ml-2">{description}</div>
            </div>
          </div>
        ))}
      </div>
    </div>
  );
};

export default ApplicationCardInfo;
