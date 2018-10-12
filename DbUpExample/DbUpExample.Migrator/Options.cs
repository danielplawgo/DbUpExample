using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using CommandLine;

namespace DbUpExample.Migrator
{
    public class Options
    {
        [Option('c', "connectionString", Required = true, HelpText = "The connection string to database that needs to be updated.")]
        public string ConnectionString { get; set; }
    }
}
