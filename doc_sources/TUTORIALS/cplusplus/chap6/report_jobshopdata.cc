//
//  Simple program to report the content of a job-shop problem instance
//  in JSSP or Taillard formats.

#include "base/commandlineflags.h"
#include "base/logging.h"
#include "constraint_solver/constraint_solver.h"

#include "jobshop.h"

DEFINE_string(
  data_file,
  "",
  "Input file with a description of the job-shop problem instance to solve "
  "in JSSP or Taillard's format.\n");

DEFINE_bool(
  complete_report,
  false,
  "Complete report?\n");

int main(int argc, char **argv) {
  google::ParseCommandLineFlags(&argc, &argv, true);
  if (FLAGS_data_file.empty()) {
    LOG(FATAL) << "Please supply a data file with --data_file=";
  }
  operations_research::JobShopData data(FLAGS_data_file);
  if (FLAGS_complete_report) {
    data.ReportAll(std::cout);
  } else {
    data.Report(std::cout);
  }

  return 0;
}
